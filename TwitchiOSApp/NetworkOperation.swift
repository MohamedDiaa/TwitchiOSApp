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
        
        manager.request(request.endpoint,parameters: request.parameters, headers: request.headers).responseJSON { (response) in
    
        switch(response.result){
        case .success(let json):
            print(json)
            
            if let json = json as? [String:Any], let top = json["top"] as? [[String:Any]]{
                
                var games = [Game]()
                for entity in top{
                    if let gameDic = entity["game"] as? [String:Any] ,let viewers = entity["viewers"] as? Int ,let id = gameDic["_id"] as? Int, let name = gameDic["name"] as? String{
                        
                        if let logo = gameDic["logo"] as? [String:String],let large = logo["large"] ,let medium = logo["medium"],let small = logo["small"] , let template = logo["template"]
                            {
                                let imageNode = ImageLinkNode(large: URL(string: large), medium: URL(string: medium), small: URL(string: small), template: template)
                                
                                let game = Game(id: id, name: name, viewers: viewers, logo: imageNode)
                                games.append(game)
                              }
                        else {
                            let game = Game(id: id, name: name, viewers: viewers, logo: nil)
                            games.append(game)
                        }
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
 }

    
    func listStreams(request:TopStreamsRequest,success:@escaping (_ streams:[Stream])->(), failure:@escaping ()->()){
        
        manager.request(request.endpoint,parameters: request.parameters, headers: request.headers).responseJSON { (response) in
        
            switch(response.result){
            case .success(let json):
                print(json)
            
            case .failure(_):
                failure()
            }
        }
    }
    
    
}
    
