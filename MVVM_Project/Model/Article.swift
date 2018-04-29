//
//  Article.swift
//  MVVM_Project
//
//  Created by Faraz Habib on 29/04/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation

class Article {
    
    var title:String
    var description:String
    var imageUrl:String
    
    init(title:String, description:String, imageUrl:String) {
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
    }
    
    init?(dictionary :[String:Any]) {
        guard let title = dictionary["title"] as? String, let description = dictionary["description"] as? String,
            let imageUrl = dictionary["imageUrl"] as? String else {
                return nil
        }
        
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
    }
    
}
