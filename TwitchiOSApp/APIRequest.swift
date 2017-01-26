//
//  APIRequest.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/26/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import Foundation

protocol BackendAPIRequest {
    
    var endpoint: String { get }
    var method: Method { get }
    var encoding: NetworkEncoding { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var showDebugPrint:Bool {get}
    var requireAuthentication:Bool{get}
}

extension BackendAPIRequest {
    
    func defaultHeaders() -> [String: String] {
        return ["client-ID": "lb715ejwkdwk9b9ljrtowl1nj595kf8"]
    }
}
