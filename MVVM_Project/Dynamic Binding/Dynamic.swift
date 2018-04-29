//
//  Dynamic.swift
//  MVVM_Project
//
//  Created by Faraz Habib on 29/04/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation

class Dynamic<T> {
    
//    var bind :(T) -> () = { _ in }
//
//    var value :T? {
//        didSet {
//            bind(value!)
//        }
//    }
//
//    init(_ v :T) {
//        value = v
//    }
    typealias Listner = (T?) -> Void
    var listner:Listner?
    
    func bind(listner:@escaping Listner) {
        self.listner = listner
    }
    
    func bindAndFire(listner:@escaping Listner) {
        self.listner = listner
        self.listner?(value)
    }
    
    var value: T? {
        didSet {
            self.listner?(value)
        }
    }
    
    init(v:T?) {
        self.value = v
    }
    
}
