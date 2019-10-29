//
//  ListActorsProtocals.swift
//  TMDB
//
//  Created by Bassem Abbas on 9/24/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

protocol ListPresenterProtocal: BasePresenterProtocol {
    
    var currentPage: Int { get set }
    
    func loadSlider()
    func loadMaterial()
    func loadImage()
    func loadVideos()
    func loadArticles()
}

protocol ListViewProtocal: BaseViewProtocal {
    func setSlider(array: [Slider])
    func setMaterial(array: [Materials])
    func setVideos(array: [Comics])
    func setImages(array: [Comics])
    func setArticles(array: [Materials])
}

protocol ListModelProtocal: BaseModelProtocal {
    func getSliderResponse(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void)
    func getMaterialResponse(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void)
    func getVideosResponse( compelation: @escaping (Result<Any, Error>) -> Void)
    func getImagesResponse( compelation: @escaping (Result<Any, Error>) -> Void)
    func getArticlesResponse( compelation: @escaping (Result<Any, Error>) -> Void)
}

protocol ListAdapterProtocal: BaseAdapterProtocal {
    
}
