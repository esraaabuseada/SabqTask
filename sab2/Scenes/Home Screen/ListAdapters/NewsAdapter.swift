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
    var articlesList = [Materials]()
    var reloadData: (() -> Void)?
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Materials) {}
    
    func add(items: [Materials]) {
     list = items
        
        reloadData?()
    }
    func addSlider(items: [Slider]){
        sliderList = items
        reloadData?()
    }
    func addImages(items: [Comics]) {
        imagesList = items
        reloadData?()
    }
    
    func addVideos(items: [Comics]) {
        videosList = items
        reloadData?()
    }
    
    func addArticles(items: [Materials])  {
        articlesList = items
        reloadData?()
    }
    
    func getMaterialsObj(index: Int)->Materials {
        return list![index]
    }
    
    func getMaterialsArray()->[Materials] {
        return list!
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
    func getArticlesArray() -> [Materials] {
        return articlesList
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
