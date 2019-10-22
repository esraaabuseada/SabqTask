//
//  ListActorModel.swift
//  TMDB
//
//  Created by user on 9/29/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
class ListModel :BaseModel,ListModelProtocal {
     var networkManager = NetworkManager()
    
    func getSliderResponse(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void) {
        networkManager.getSlider_MaterialResponse(pageNumber: page) { result,statusCode  in
            do {
                let res = try result.get()
                
                var sliderArray = res.slider
                compelation(.success(sliderArray) )
            }
            catch {
                print(error.localizedDescription)
                compelation(.failure(error))
            }
            
        }
        
    }
    
    func getMaterialResponse(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void) {
        networkManager.getSlider_MaterialResponse(pageNumber: page) { result,statusCode  in
            do {
                let res = try result.get()
                
                var materialsArray = res.materials
                compelation(.success(materialsArray) )
            }
            catch {
                print(error.localizedDescription)
                compelation(.failure(error))
            }
            
        }
        
    }
    
}
