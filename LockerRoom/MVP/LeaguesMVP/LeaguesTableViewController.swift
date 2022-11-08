//
//  LeaguesTableViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 3.11.22..
//

import UIKit


class LeaguesTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var player: PlayerModel?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension LeaguesTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension LeaguesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numOfLeagues = player?.data.leagues.count else { return 6}
        return numOfLeagues
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LeaguesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        if let player = player {
            
            if let player1 = self.player?.data.leagues[indexPath.row] {
                cell.populateCell(with: player1)
            }
        }
        return cell
    }
}
