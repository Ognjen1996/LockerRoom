//
//  RosterViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 17.11.22..
//

import UIKit

class RosterViewController: UIViewController {

    
    var presenter: RosterPresenter?
    var rosterData: RosterData? {
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        presenter?.fetchRosterData()
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setupDelegates() {
        presenter?.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    private func statsForRoster() {
        
    }
}
extension RosterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let num = rosterData?.players.count else { return 1}
        return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: RosterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RosterTableViewCell") as! RosterTableViewCell
        guard let rosterData = rosterData else {return cell}
        cell.configure(with: rosterData.players[indexPath.row])
        return cell
    }
}
extension RosterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboad = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboad.instantiateViewController(withIdentifier: "RosterStatsViewController") as! RosterStatsViewController
        self.present(vc, animated: true)
    }
}
extension RosterViewController: RosterPresenterDelegate {
    func rosterPresenter(_ presenter: RosterPresenter, data: RosterData) {
        self.rosterData = data
    }
}
