//
//  ListActorsPresenter.swift
//  TMDB
//
//  Created by user on 9/30/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ListPresenter: BasePresenter,ListPresenterProtocal {
    
    
    
    var model: ListModelProtocal?
    var view: ListViewProtocal?
    var currentPage: Int = 1
    
   
    init(viewProtocole :ListViewProtocal , modelProtocol: ListModelProtocal ){
    
        view = viewProtocole
        model = modelProtocol
  
    }
    
    required init(view: BaseViewProtocal, model: BaseModelProtocal) {
        fatalError("init(view:model:) has not been implemented")
    }
    
    
    
    func loadSlider() -> [Slider] {
        model?.getSliderResponse(forPage: currentPage) { result in
            switch result {
            case .success(let sliderResponse):
                
                print(sliderResponse)
                self.view?.getSlider(array: sliderResponse as! [Slider] )
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadMaterial() -> [Materials] {
        model?.getSliderResponse(forPage: currentPage) { result in
            switch result {
            case .success(let materialResponse):
                
                print(materialResponse)
                self.view?.getMaterial(array: materialResponse as! [Materials] )
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
    









