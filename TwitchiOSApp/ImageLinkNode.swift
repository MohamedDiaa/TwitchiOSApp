//
//  ImageLinkNode.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/26/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import Foundation
import UIKit

struct ImageLinkNode{
    let large:URL?
    let medium:URL?
    let small:URL?
    let template:String?
    
    func getImage(size:CGSize) -> URL?{
        
        if let template = self.template{
            let temp2 =  template.replacingOccurrences(of: "{width}", with: "\(Int(size.width))")
            let temp3 = temp2.replacingOccurrences(of: "{height}", with: "\(Int(size.height))")
        
            print(temp3)
            return URL(string: temp3)
        }
        return self.large
    }
}
