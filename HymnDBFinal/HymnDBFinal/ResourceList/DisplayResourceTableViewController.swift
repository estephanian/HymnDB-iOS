//
//  DisplayResourceTableViewController.swift
//  HymnDBFinal
//
//  Created by Logan Dorsey on 4/26/18.
//  Copyright © 2018 Adrien Ibarra. All rights reserved.
//

import UIKit
import MaterialComponents
import IBAnimatable
import IoniconsKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class DisplayResourceTableViewController: UITableViewController {
    var resourceList:JSON = []
    
    var category:Int! = 0
    var noQuizUrl = "http://ec2-34-209-251-224.us-west-2.compute.amazonaws.com:3000/resource/approved/type/"
    var quizUrl = "http://ec2-34-209-251-224.us-west-2.compute.amazonaws.com:3000/quiz/resource/"
    var quizDict: [String:Any] = [:]
    var isQuiz:Bool = false

    
    override func viewDidLoad() {
        var url = noQuizUrl
        if(isQuiz)
        {
            url = quizUrl
        }
        
        switch category{
        case 0:
            url = url + "book"
        case 1:
            url = url + "hymnal%2Fsongbook"
        case 2:
            url = url + "thesis%2Fdissertation"
        case 3:
            url = url + "article(s)"
        case 4:
            url = url + "blog"
        case 5:
            url = url + "forum"
        case 6:
            url = url + "Newsletter%2FE-News"
        case 7:
            url = url + "Audio%20Track(s)"
        case 8:
            url = url + "podcast"
        case 9:
            url = url + "Video%2FVisual(s)"
        default:
            print("Category out of range")
            
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //Not a quiz
        if(!isQuiz){
            Alamofire.request(url, method: .get).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    self.resourceList = JSON(value)
                    print(self.resourceList.count)
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
        else
        {
            Alamofire.request(url, method: .post, parameters: quizDict, encoding: JSONEncoding.default).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    self.resourceList = JSON(value)
                    print(self.resourceList.count)
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
        self.tableView.reloadData()
        
        super.viewDidLoad();

}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            

        case "showDetail":
            guard let DetailViewController = segue.destination as? DisplayResourceDetailViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedResourceCell = sender as? DisplayResourceTableCell else {
                fatalError("Unexpected sender: \(sender ?? "NOSENDER")")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedResourceCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedResource = self.resourceList[indexPath.row]
            DetailViewController.toDisplay = selectedResource
            
        default: break
            
        }
    }
    
}

extension DisplayResourceTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DisplayResourceTableCell else {
            fatalError("The dequeued cell is not an instance of DisplayResourceTableCell.")
        }
        
        
        cell.Title.text = self.resourceList[indexPath.row]["title"].string
        cell.Description.text = "By: " + self.resourceList[indexPath.row]["author"].string!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resourceList.count
    }
    
}
