//
//  SliderAdapter.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
import UIKit
class SliderAdapter: NSObject, ListAdapterProtocal, UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    var list: [Slider]?
    typealias DataType = Slider
    var pageControl: UIPageControl!
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    func add(item: Slider) {}
    
    func setAdaptor(pageControl: UIPageControl) {
        self.pageControl = pageControl
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SliderCollectionViewCell" ,
            for: indexPath) as? SliderCollectionViewCell  else {
                fatalError("cell empty")
        }
        guard  let sliderObj = list?[indexPath.row] else { fatalError("no object") }
       collectionCell.configur(slioderObj: sliderObj)
        pageControl.currentPage = indexPath.row 
        
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
 
        return CGSize(width: collectionView.frame.size.width ,
                      height: collectionView.frame.size.height )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
       
    }
        
}
