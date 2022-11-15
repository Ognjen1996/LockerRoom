//
//  WeightRoomViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 15.11.22..
//

import UIKit

class WeightRoomViewController: UIViewController {
    
    var practiceData: [PracticeData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var data: [WeightRoomData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var isForPracticeRoom: Bool = false
    var isForWeightRoom: Bool = false
    var presenter1: PracticeRoomPresenter?
    var presenter: WeightRoomPresenter?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isForWeightRoom {
            presenter?.fethcData()
        }
        if isForPracticeRoom {
            presenter1?.fetchData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        presenter1?.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
extension WeightRoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isForWeightRoom {
            return data?.count ?? 3
        }
        if isForPracticeRoom {
            return practiceData?.count ?? 3
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CalendarTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CalendarTableViewCell", for: indexPath) as! CalendarTableViewCell
        if isForWeightRoom {
            guard let data = data else {return cell}
            let weightRoom = data[indexPath.row]
            cell.setupWeightRoom(with: weightRoom)
            return cell
        }
        else if isForPracticeRoom {
            guard let practiceData = practiceData else {return cell}
            cell.setupPracticeRoom(with: practiceData, n: indexPath.row)
            return cell
        }
        return cell
    }
}
extension WeightRoomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboad = UIStoryboard(name: "Calendar", bundle: nil)
        let vc = storyboad.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        if isForWeightRoom {
            vc.weightRoomData = data
            vc.flag = 5
            show(vc, sender: self)
        }
        if isForPracticeRoom {
            guard let practiceData = practiceData else {return}
            vc.selectedPractice = practiceData[indexPath.row]
            vc.flag = 6
            show(vc, sender: self)
        }

    }
}

extension WeightRoomViewController: WeightRoomPresenterDelegate {
    func weightRoomPresenter(_ presenter: WeightRoomPresenter, data: [WeightRoomData]) {
        self.data = data
        
    }
}
extension WeightRoomViewController: PracticeRoomPresenterDelegate {
    func practiceRoomPresenter(_ presenter: PracticeRoomPresenter, data: [PracticeData]) {
        self.practiceData = data
    }
    
    
}
