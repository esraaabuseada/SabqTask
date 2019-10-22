//
//  ListActorsProtocals.swift
//  TMDB
//
//  Created by Bassem Abbas on 9/24/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

protocol ListPresenterProtocal: BasePresenterProtocol {
    
    var currentPage:Int { get set }
    
    func loadSlider()
    func loadMaterial()
    
    
}

protocol ListViewProtocal:BaseViewProtocal {
    func getSlider(array: [Slider])
    func getMaterial(array: [Materials])
    
}

protocol ListModelProtocal:BaseModelProtocal {
    func getSliderResponse(forPage page:Int , compelation: @escaping (Result<Any,Error>) -> Void)
     func getMaterialResponse(forPage page:Int , compelation: @escaping (Result<Any,Error>) -> Void)
}


protocol ListAdapterProtocal:BaseAdapterProtocal  {
    
}

