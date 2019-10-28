//
//  ArticlesAdapter.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
class ArticlesAdapter: ListAdapterProtocal {
    typealias DataType = Materials
    var list: [Materials]?
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Materials) {}
    
    func getArticlesObj(index: Int) -> Materials {
        guard let listObj = list?[index] else {
            fatalError("no articles provided")
        }
        return listObj
    }
    func add(items: [Materials]) {
        list = [Materials]()
        list = items
        reloadData?()
    }
    
    func update(item: Materials) {}
    
    func count() -> Int {
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        
        return true
    }
    
    func clear(reload: Bool) {
        
    }
    
}
