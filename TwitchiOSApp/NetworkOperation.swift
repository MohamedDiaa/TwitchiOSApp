//
//  NetworkOperation.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/26/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import Foundation
import Alamofire

public class NetworkOperation{
    
    var manager = SessionManager()
    
    public static let sharedInstance = NetworkOperation()
    private init() {
        
    }


func listGames(request:TopGamesRequest,success:@escaping (_ games:[Game])->(), failure:@escaping ()->()){
    
    manager.request(request.endpoint, headers: request.headers).responseJSON { (response) in
    
        switch(response.result){
        case .success(let json):
            print(json)
            
            if let json = json as? [String:Any], let data = json["data"] as? [[String:Any]]{
                
                var games = [Game]()
                for datum in data{
                    if let id = datum["id"] as? Int, let name = datum["name"] as? String{
                        let game = Game(id: id, name: name, viewers: 0, logo: nil)
                        games.append(game)
                    }
                }
                return success(games)
            }else{
                failure()
            }
        case .failure(_):
            failure()
        }

    }
    /*
    manager.request(request.endpoint, method: HTTPMethod.get, parameters: request.parameters, encoding: request.query.encoding, headers: request.headers).responseJSON { (response) in
        
        
        }
     */
    }

}
    
