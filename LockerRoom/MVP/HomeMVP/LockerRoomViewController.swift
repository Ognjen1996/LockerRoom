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
    
    var user: Login?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewLR.dataSource = self
        tableViewLR.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension LockerRoomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WeightRoomViewController") as! WeightRoomViewController
            guard let user = user else {return}
//            vc.presenter = CalendarPresenter(user: user)
            vc.presenter1 = PracticeRoomPresenter(user: user)
            vc.isForPracticeRoom = true
            show(vc, sender: self)
        }
        if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WeightRoomViewController") as! WeightRoomViewController
            guard let user = user else {return}
            vc.presenter = WeightRoomPresenter(user: user)
            vc.isForWeightRoom = true
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
