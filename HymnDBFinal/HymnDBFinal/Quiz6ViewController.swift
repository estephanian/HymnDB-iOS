//
//  Quiz2ViewController.swift
//  HymnDBFinal
//
//  Created by Adrien Ibarra on 3/27/18.
//  Copyright © 2018 Adrien Ibarra. All rights reserved.
//

import Foundation
//
//  QuizViewController.swift
//  HymnDBFinal
//
//  Created by Adrien Ibarra on 3/22/18.
//  Copyright © 2018 Adrien Ibarra. All rights reserved.
//

import UIKit

class Quiz6ViewController: UITableViewController {
    
    @IBOutlet weak var previous: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    private var quizItems = myEthnicities().getMockData()
    private var questionTitle = ["What ethnicities/races make up at least 20% of your congregation"]
    var quizDict: [String:Any] = [:]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return questionTitle[0]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizItems.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 17)
        label.text = "What ethnicities/races make up at least 20% of your congregation"
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < quizItems.count
        {
            let item = quizItems[indexPath.row]
            item.status_switch()
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quiz", for: indexPath)
        
        if indexPath.row < quizItems.count
        {
            let item = quizItems[indexPath.row]
            cell.textLabel?.text = item.title
            cell.textLabel?.numberOfLines = 0
            cell.textLabel!.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
            
            let accessory: UITableViewCellAccessoryType = item.done ? .checkmark : .none
            cell.accessoryType = accessory
        }
        return cell
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "Question 6 of 7:"
        
        tableView.sectionHeaderHeight = 50;
        tableView.estimatedSectionHeaderHeight = 50;
        
        nextButton.layer.borderWidth = 1.0;
        nextButton.backgroundColor = UIColor.white
        nextButton.layer.borderColor = UIColor(white: 0.5, alpha: 0.7).cgColor
        nextButton.layer.cornerRadius = 10
        
        previous.layer.borderWidth = 1.0;
        previous.backgroundColor = UIColor.white
        previous.layer.borderColor = UIColor(white: 0.5, alpha: 0.7).cgColor
        previous.layer.cornerRadius = 10
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



