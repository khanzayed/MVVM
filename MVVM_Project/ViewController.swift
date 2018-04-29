//
//  ViewController.swift
//  MVVM_Project
//
//  Created by Faraz Habib on 29/04/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var viewModel: AddArticlesListViewModal? {
        didSet {
            if let list = viewModel?.articlesList {
                list.bindAndFire { (value) in
                    if value != nil {
                        // Reload table view
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getDetails()  {
        Webservice().getArticles(url: URL(string: "")!) { [weak self] (articleList) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.viewModel = AddArticlesListViewModalFromArticle(articleList: articleList)
        }
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = viewModel?.articlesList.value {
            return list.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifire")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifire")
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

