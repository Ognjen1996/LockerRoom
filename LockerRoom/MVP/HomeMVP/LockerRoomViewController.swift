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
    
//    var user: Login
//
//    init(user: Login) {
//
//        self.user = user
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewLR.dataSource = self
        tableViewLR.delegate = self
        // Do any additional setup after loading the view.
    }
}
extension LockerRoomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WeightRoomViewController") as! WeightRoomViewController
            vc.presenter = WeightRoomPresenter()
            show(vc, sender: self)
        }
        if indexPath.row == 4 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PlaybookViewController") as! PlaybookViewController
            vc.presenter = PlaybookPresenter()
            show(vc, sender: self)
        }
    }
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
