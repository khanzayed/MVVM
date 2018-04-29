//
//  Webservice.swift
//  MVVM_Project
//
//  Created by Faraz Habib on 29/04/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation

class Webservice {
    
    func getArticles(url :URL, callback :@escaping ([Article]) -> ()) {
        var articles = [Article]()
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! [String:Any]
                
//                let articleDictionaries = dictionary["articles"] as! [String:Any]
//                articles = articleDictionaries.flatMap { dictionary in
//                    return Article(dictionary :dictionary)
//                }
            }
            
            DispatchQueue.main.async {
                callback(articles)
            }
            
        }.resume()
    }
    
}
