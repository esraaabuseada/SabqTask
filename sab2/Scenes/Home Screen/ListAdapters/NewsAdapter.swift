//
//  NewsAdapter.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation
class NewsAdapter: ListAdapterProtocal {
    typealias DataType = Materials
    var list: [Materials]?
    var sliderList = [Slider]()
    var imagesList = [Comics]()
    var videosList = [Comics]()
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Materials) {}
    
    func add(items: [Materials]) {
     list = items
        
        reloadData?()
    }
    func addSlider(items: [Slider]) -> [Slider] {
        sliderList = items
        return sliderList
    }
    func addImages(items: [Comics]) -> [Comics] {
        imagesList = items
        return imagesList
    }
    
    func addVideos(items: [Comics]) -> [Comics] {
        videosList = items
        return videosList
    }
    
    func getMaterialsObj(index: Int)->Materials {
        return list![index]
    }
    func getSliderArray()-> [Slider]{
        return sliderList
    }
    
    func getImagesArray()->[Comics]{
        return imagesList
    }
    
    func getVideosArray() -> [Comics] {
        return videosList
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
