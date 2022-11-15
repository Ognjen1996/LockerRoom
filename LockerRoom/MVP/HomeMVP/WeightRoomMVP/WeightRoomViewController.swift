//
//  WeightRoomViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 15.11.22..
//

import UIKit

class WeightRoomViewController: UIViewController {
    
    var data: [WeightRoomData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }

    var presenter: WeightRoomPresenter?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fethcData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rowHeight = UITableView.automaticDimension
    }
    
}
extension WeightRoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CalendarTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CalendarTableViewCell", for: indexPath) as! CalendarTableViewCell
        guard let data = data else {return cell}
        let weightRoom = data[indexPath.row]
        cell.setupWeightRoom(with: weightRoom)
        cell.isUserInteractionEnabled = false
        return cell
    }
}
extension WeightRoomViewController: UITableViewDelegate {
    
}

extension WeightRoomViewController: WeightRoomPresenterDelegate {
    func weightRoomPresenter(_ presenter: WeightRoomPresenter, data: [WeightRoomData]) {
        self.data = data
        
    }
    
    
}
