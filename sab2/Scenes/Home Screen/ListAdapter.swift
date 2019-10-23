//
//  ListActorAdapter.swift
//  TMDB
//
//  Created by user on 9/30/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
class ListAdapter: ListAdapterProtocal {
    
    typealias DataType = ListApiResponse
        var list: [ListApiResponse]? = [ListApiResponse]()
     var listVideosImages: [VideosImagesApiResponse]? = [VideosImagesApiResponse]()

     var sliderList = [Slider]()
     var materialsList = [Materials]()
     var imagesList = [Comics]()
     var videosList = [Comics]()
        var reloadData: (() -> Void)?
    
        var showEmptyState: ((Bool) -> Void)?
    
    
        func add(item: ListApiResponse) {
            
    
        }
    
        func getListResponse(index: Int)->ListApiResponse {
            return list![index]
    
        }
    
    
        func add(items: [ListApiResponse]) {
            list?.append(contentsOf: items)
            reloadData?()
        }
    
    func addSlider(items: [Slider]) {
        sliderList.append(contentsOf: items)
        reloadData?()
    }
    func addMaterials(items: [Materials]) {
        materialsList.append(contentsOf: items)
        reloadData?()
    }
    
    func addImages(items: [Comics]) {
        imagesList.append(contentsOf: items)
        reloadData?()
    }
    
    func addVideos(items: [Comics]) {
        videosList.append(contentsOf: items)
        reloadData?()
    }
    
        func update(item: ListApiResponse) {
    
        }
    
        func count() -> Int {
    
            return list?.count ?? 0
        }
    
         func isLastIndex(index: IndexPath) -> Bool {
    
            return true
        }
    
        func clear(reload: Bool) {
    
        }
    
    func getSliderCount()->Int{
       
        for i in list! {
            sliderList = list![0].slider!
        }
        return sliderList.count
    }
    
    func getMaterialsCount()->Int{
       
        for i in list! {
            materialsList = list![0].materials!
        }
        return materialsList.count
    }
    
    func getVideosCount()->Int{
        
        for i in listVideosImages! {
            videosList = listVideosImages![0].comics!
        }
        return videosList.count
    }
    
    func getImagesCount()->Int{
        
        for i in listVideosImages! {
            imagesList = listVideosImages![0].comics!
        }
        return imagesList.count
    }
}
