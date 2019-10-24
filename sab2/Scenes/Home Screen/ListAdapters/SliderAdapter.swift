//
//  SliderAdapter.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
class SliderAdapter: ListAdapterProtocal {
    var list: [Slider]?
    typealias DataType = Slider
    
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    func add(item: Slider) {}
    
    //func setAdaptor
    
    func add(items: [Slider]) {
       list = [Slider]()
        list = items
        reloadData?()
    }

    func update(item: Slider) {}
    
    func count() -> Int {
        
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        
        return true
    }
    
    func clear(reload: Bool) {
        
    }
    func getSliderObj(index: Int) -> Slider?{
       
        return list?[index]
    }
}
