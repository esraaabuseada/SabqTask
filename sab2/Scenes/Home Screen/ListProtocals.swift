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
    
    func activateSearch()
    func cancelSearch()
    func loadActors()
    func refreshActores()
    func loadMoreActores()
    
}

protocol ListViewProtocal:BaseViewProtocal {
    //func getList(array: [Person])
}

protocol ListModelProtocal:BaseModelProtocal {
   // func getActors(forPage page:Int , compelation: @escaping (Result<Any,Error>) -> Void)
}


protocol ListAdapterProtocal:BaseAdapterProtocal  {
    
}

