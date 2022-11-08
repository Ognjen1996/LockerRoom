//
//  ChatViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 31.10.22..
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
//        let separator = cell.separatorInset.bottom
        
        return cell
    }
    
    
}
