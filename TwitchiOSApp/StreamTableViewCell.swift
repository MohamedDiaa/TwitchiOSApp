//
//  StreamTableViewCell.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/27/17.
//  Copyright © 2017 Greenly. All rights reserved.
//


import UIKit

class StreamTableViewCell: UITableViewCell {

    @IBOutlet var streamTitleLabel:UILabel!
    @IBOutlet var streamViewersLabel:UILabel!
    @IBOutlet var streamImageView:UIImageView!

    var stream:Stream?
    
    func setStream(stream:Stream){
        self.stream = stream
        self.clean()
        self.fillData()
    }
    
    func fillData(){
        if let stream = self.stream{
            self.streamTitleLabel.text = stream.name
            self.streamViewersLabel.text = "\(stream.viewers)"
            
            //let imageSize = CGSize(width: self.bounds.size.width * self.contentScaleFactor , height: self.bounds.size.height * contentScaleFactor)
            
            let imageSize = CGSize(width: 1000 , height: 800)
            
            if let logoNode = stream.logo,let logoURL = logoNode.getImage(size: imageSize){
                
                self.streamImageView.af_setImage(withURL: logoURL)
            }
        }
    }
    func clean(){
        self.streamViewersLabel.text = nil
        self.streamTitleLabel.text = nil
        self.streamImageView.image = nil
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
