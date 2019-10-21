//
//  ProductService.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import Moya

//swiftlint:disable  force_unwrapping

enum  ListService {
    case slider_material( page : Int)
    
}
//https://sabq.org/api/material/homepage-light-version/
extension ListService: TargetType {
    var baseURL: URL {
        
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .slider_material:
            return "/material/homepage-light-version"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .slider_material:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .slider_material:
            return Data()
        }
    }
    
    var task: Task {        
        switch self {
        case .slider_material(let page) :
			return .requestParameters(
                parameters: ["page":page],
				encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
