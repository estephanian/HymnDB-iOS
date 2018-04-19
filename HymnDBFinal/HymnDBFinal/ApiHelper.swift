//
//  ApiHelper.swift
//  HymnDBFinal
//
//  Created by Emily Stephanian on 4/18/18.
//  Copyright © 2018 Adrien Ibarra. All rights reserved.
//

import UIKit

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON


class ApiHelper {
    
    static func getResourceImg(_ resourceImg: JSON) {
        
        Alamofire.request("https://s3-us-west-2.amazonaws.com/hymndbphotos/" + "\(resourceImg)", method: .get).responseImage { response in
            guard let image = response.result.value
                
                else {
                // Handle error
                return
            }
        }
    }
    
//    static func setResourceImg(path:String, id:String, type:String, completionHandler: @escaping (String?, Error?) -> ()) {
//        getProfilePic("pictures/?id=\(id)&picture_type=\(type)", completionHandler: completionHandler)
//    }

}
