//
//  TopGamesRequest.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/26/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import Foundation


final class TopGamesRequest: BackendAPIRequest {
    
      let limit:Int?
      let offset:Int?
    
    init(limit:Int?,offset:Int? = nil){
        
        self.limit = limit
        self.offset = offset
    }

    var endpoint: String {
        return "https://api.twitch.tv/kraken/games/top"
    }
    var method: Method {
        return Method.get
    }
    var encoding: NetworkEncoding {
        return NetworkEncoding.path
    }
    var parameters: [String: Any]? {
        var param = [String:Any]()
        
        if let limit = self.limit{
            
            param["limit"] = limit
        }
        if let offset = self.offset{
            
            param["offset"] = offset
        }
        return param

    }
    var headers: [String: String]? {
        return self.defaultHeaders()
    }
    var showDebugPrint:Bool {
        return false
    }
    var requireAuthentication:Bool{
        return true
    }
 
}
