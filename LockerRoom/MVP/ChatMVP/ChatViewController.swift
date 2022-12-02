//
//  ChatViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 31.10.22..
//

import UIKit
import PusherSwift

class ChatViewController: UIViewController, PusherDelegate {
    
    @IBOutlet weak var tableVIew: UITableView!
    
        var pusher: Pusher!

    override func viewDidLoad() {
        super.viewDidLoad()
        pusher = Pusher(key: "key")
        
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }
}
extension ChatViewController: UITableViewDelegate {
    
}
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LeaguesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        cell.lastMessageLabel.text = "Eee sefe imam neku malu povredu"
        cell.nameChatLabel.text = "Nikola Ivanovic"
        
        return cell
    }
    
    
}
