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
        if indexPath.row == 0 || indexPath.row == 7 {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RosterViewController") as! RosterViewController
            guard let user = user else {return}
            vc.presenter = RosterPresenter(user: user)
            show(vc, sender: self)
        }
        if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "Calendar", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as!
            CalendarViewController
            guard let user = user else {return}
            vc.presenter = CalendarPresenter(user: user)
            show(vc, sender: self)
        }
        if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WeightRoomViewController") as! WeightRoomViewController
            guard let user = user else {return}
            vc.presenter1 = PracticeRoomPresenter(user: user)
            vc.isForPracticeRoom = true
            vc.isForWeightRoom = false
            vc.isForMedicalRoom = false
            show(vc, sender: self)
        }
        if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WeightRoomViewController") as! WeightRoomViewController
            guard let user = user else {return}
            vc.presenter = WeightRoomPresenter(user: user)
            vc.isForWeightRoom = true
            vc.isForMedicalRoom = false
            vc.isForPracticeRoom = false
            vc.isForSelfScouting = false
            show(vc, sender: self)
        }
        if indexPath.row == 4 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PlaybookViewController") as! PlaybookViewController
            guard let user = user else {return}
            vc.presenter = PlaybookPresenter(user: user)
            show(vc, sender: self)
        }
        if indexPath.row == 5 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "WeightRoomViewController") as! WeightRoomViewController
            guard let user = user else {return}
            vc.presenter3 = SeflScoutingPresenter(user: user)
            vc.isForWeightRoom = false
            vc.isForMedicalRoom = false
            vc.isForPracticeRoom = false
            vc.isForSelfScouting = true
            show(vc, sender: self)
        }
        if indexPath.row == 6 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "WeightRoomViewController") as! WeightRoomViewController
            guard let user = user else {return}
            vc.presenter2 = CalendarPresenter(user: user)
            vc.isForMedicalRoom = true
            vc.isForWeightRoom = false
            vc.isForPracticeRoom = false
            vc.isForSelfScouting = false
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
