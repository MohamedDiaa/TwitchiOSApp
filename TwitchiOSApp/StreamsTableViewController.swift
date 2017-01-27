//
//  StreamsTableViewController.swift
//  TwitchiOSApp
//
//  Created by MohamedDiaa on 1/27/17.
//  Copyright © 2017 Greenly. All rights reserved.
//

import UIKit

class StreamsTableViewController: UITableViewController {
    
    var streams:[Stream]?
    var game:Game
   
    init(game:Game){
        self.game = game
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.title = "Top Streams"
        self.tableView.register(UINib(nibName: "StreamTableViewCell", bundle: nil), forCellReuseIdentifier: "StreamTableViewCell")

        NetworkOperation.sharedInstance.listStreams(request: TopStreamsRequest(game: self.game, limit: 5), success: {streams in
            
            self.streams = streams
            self.tableView.reloadData()
            
            }, failure: {
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let streams = self.streams{
            return streams.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StreamTableViewCell", for: indexPath) as! StreamTableViewCell
        
        // Configure the cell...
        if let streams = self.streams , indexPath.row < streams.count{
            cell.setStream(stream: streams[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


}
