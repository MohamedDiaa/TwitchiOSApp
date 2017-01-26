//
//  GameTableViewCell.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/27/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import UIKit
import AlamofireImage

class GameTableViewCell: UITableViewCell {

    @IBOutlet var gameTitleLabel:UILabel!
    @IBOutlet var gameViewersLabel:UILabel!
    @IBOutlet var gameImageView:UIImageView!

    var game:Game?
    
    func setGame(game:Game){
            self.game = game
            self.clean()
            self.fillData()
    }
    
    func fillData(){
        if let game = self.game{
            self.gameTitleLabel.text = game.name
            self.gameViewersLabel.text = "\(game.viewers)"
            
            //let imageSize = CGSize(width: self.bounds.size.width * self.contentScaleFactor , height: self.bounds.size.height * contentScaleFactor)
            
            let imageSize = CGSize(width: 1000 , height: 800)

            if let logoNode = game.logo,let logoURL = logoNode.getImage(size: imageSize){
                
                self.gameImageView.af_setImage(withURL: logoURL)
            }
        }
    }
    func clean(){
        self.gameViewersLabel.text = nil
        self.gameTitleLabel.text = nil
        self.gameImageView.image = nil
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
