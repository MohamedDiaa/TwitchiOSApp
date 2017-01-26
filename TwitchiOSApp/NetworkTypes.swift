//
//  NetworkTypes.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/26/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import Foundation
import Alamofire

enum Method: String {
    case get, post, put, delete
    
    var httpMethod:HTTPMethod{
        switch self {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        case .delete:
            return HTTPMethod.delete
        case .put:
            return HTTPMethod.put
        }
    }
}

enum NetworkEncoding {
    case json, path,pathQuery
    
    var encoding:ParameterEncoding{
        switch self {
        case .json:
            return  JSONEncoding.default
            
        case .path:
            return URLEncoding.default
            
        case .pathQuery:
            return URLEncoding.httpBody
        }
    }
}
