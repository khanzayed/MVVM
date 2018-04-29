//
//  ArticlesViewModal.swift
//  MVVM_Project
//
//  Created by Faraz Habib on 29/04/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation
import UIKit

protocol AddArticleViewModel {
    
    var title:Dynamic<String> { get }
    var articleDescription:Dynamic<String> { get }
    var image:Dynamic<UIImage> { get }
    
}

class AddArticleViewModelFromArticle: AddArticleViewModel {
    
    var title: Dynamic<String>
    var articleDescription: Dynamic<String>
    var image: Dynamic<UIImage>
    
    init(article:Article) {
        title = Dynamic(v: article.title)
        articleDescription = Dynamic(v: article.description)
        image = Dynamic(v: UIImage(named: article.imageUrl)!)
    }
    
}

protocol AddArticlesListViewModal {
    var articlesList:Dynamic<[AddArticleViewModelFromArticle]> { get }
}

class AddArticlesListViewModalFromArticle: AddArticlesListViewModal {
    
    var articlesList: Dynamic<[AddArticleViewModelFromArticle]>
 
    init(articleList:[Article]) {
        var list = [AddArticleViewModelFromArticle]()
        for article in articleList {
            let articleViewModel = AddArticleViewModelFromArticle(article: article)
            list.append(articleViewModel)
        }
        articlesList = Dynamic(v: list)
    }
    
}
