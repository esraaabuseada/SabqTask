//
//  ListActorsPresenter.swift
//  TMDB
//
//  Created by user on 9/30/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

//class ListPresenter: BasePresenter,ListActorsPresenterProtocal {
//    var model: ListActorsModelProtocal?
//    var view: ListActorsViewProtocal?
//    var currentPage: Int = 1
//    
//   
//    init(viewProtocole :ListActorsViewProtocal , modelProtocol: ListActorsModelProtocal ){
//    
//        view = viewProtocole
//        model = modelProtocol
//  
//    }
//    
//    
//    func activateSearch() {
//        
//    }
//    
//    func cancelSearch() {
//        
//    }
//    
//    func loadActors() {
//        model?.getActors(forPage: currentPage) { result in
//            switch result {
//            case .success(let apiResponse):
//                
//                print(apiResponse)
//                self.view?.getList(array: apiResponse as! [Person] )
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    func refreshActores() {
//    
//    }
//    
//    func loadMoreActores() {
//        currentPage = currentPage+1
//        model?.getActors(forPage: currentPage) { result in
//            switch result {
//            case .success(let apiResponse):
//                
//                print(apiResponse)
//                self.view?.getList(array: apiResponse as! [Person] )
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        
//        
//    }
//    
//
//}
