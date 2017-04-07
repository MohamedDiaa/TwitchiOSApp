//
//  ViewController.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/26/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import UIKit
import SharedWOK

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gameController = GamesViewController()
        
        let navController = UINavigationController(rootViewController: gameController)
        self.addChildViewController(navController)
        navController.view.frame = self.view.bounds
        self.view.addSubview(navController.view)
        
      let _ =  Language.Arabic.flag
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

