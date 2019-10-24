//
//  ImagesAdapter.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
class ImagesAdapter: ListAdapterProtocal {
    typealias DataType = Comics
    var list: [Comics]?
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Comics) {}
    
    func getImagessObj(index: Int)->Comics {
        return list![index]
    }
    func add(items: [Comics]) {
        list?.append(contentsOf: items)
        reloadData?()
    }
    
    func update(item: Comics) {}
    
    func count() -> Int {
        
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        
        return true
    }
    
    func clear(reload: Bool) {
        
    }
    
}
