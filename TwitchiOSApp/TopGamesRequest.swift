//
//  TopGamesRequest.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/26/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import Foundation


final class TopGamesRequest: BackendAPIRequest {
    
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
        return nil
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