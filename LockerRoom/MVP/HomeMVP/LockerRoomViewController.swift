//
//  LockerRoomViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 10.11.22..
//

import UIKit

class LockerRoomViewController: UIViewController {

    
    @IBOutlet weak var tableViewLR: UITableView!
    var menuData = ["Roster", "Game Plan", "Practice Plan", "Weight Room", "Playbook", "Self Scouting", "Medical", "Stats"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewLR.dataSource = self
        tableViewLR.delegate = self
        // Do any additional setup after loading the view.
    }
}
extension LockerRoomViewController: UITableViewDelegate {
    
}
extension LockerRoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: LoockerRoomTableViewCell = tableViewLR.dequeueReusableCell(withIdentifier: "LoockerRoomTableViewCell", for: indexPath) as! LoockerRoomTableViewCell
        cell.setup(with: menuData, n: indexPath.row)
        return cell
    }
    
    
}
