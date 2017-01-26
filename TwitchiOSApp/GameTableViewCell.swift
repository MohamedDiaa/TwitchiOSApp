//
//  GameTableViewCell.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/27/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet var gameTitleLabel:UILabel!
    @IBOutlet var gameViewersLabel:UILabel!
    @IBOutlet var gameImageView:UIImageView!

    var game:Game?
    
    func setGame(game:Game){
            self.game = game
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
