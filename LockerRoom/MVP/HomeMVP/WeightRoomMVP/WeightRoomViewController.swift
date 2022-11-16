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
    var medicalData : [MedicalData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var selfScoutingData: SelfScoutingData? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var isForMedicalRoom: Bool = false
    var isForPracticeRoom: Bool = false
    var isForWeightRoom: Bool = false
    var isForSelfScouting: Bool = false
    var presenter1: PracticeRoomPresenter?
    var presenter: WeightRoomPresenter?
    var presenter2: CalendarPresenter?
    var presenter3: SeflScoutingPresenter?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isForWeightRoom {
            presenter?.fethcData()
        }
        if isForPracticeRoom {
            presenter1?.fetchData()
        }
        if isForMedicalRoom {
            presenter2?.fetchData(for: "3")
        }
        if isForSelfScouting {
            presenter3?.fetchData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
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
        if isForMedicalRoom {
            return medicalData?.count ?? 3
        }
        if isForSelfScouting {
            return selfScoutingData?.players.count ?? 1
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
        if isForPracticeRoom {
            guard let practiceData = practiceData else {return cell}
            cell.setupPracticeRoom(with: practiceData, n: indexPath.row)
            return cell
        }
        if isForMedicalRoom {
            guard let medicalData = medicalData else {return cell}
            cell.setupMedicalRoom(with: medicalData, n: indexPath.row)
            return cell
        }
        if isForSelfScouting {
            guard let selfScoutingData = selfScoutingData else {return cell}
            cell.setupSelfScouting(with: selfScoutingData, n: indexPath.row)
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
            guard let data = data else {return}
            vc.weightRoomData = data[indexPath.row]
            vc.flag = 5
            show(vc, sender: self)
        }
        if isForPracticeRoom {
            guard let practiceData = practiceData else {return}
            vc.selectedPractice = practiceData[indexPath.row]
            vc.flag = 6
            show(vc, sender: self)
        }
        if isForMedicalRoom {
            guard let medicalData = medicalData else {return}
            vc.selectedMedical = medicalData[indexPath.row]
            vc.flag = 3
            show(vc, sender: self)
        }
        if isForSelfScouting {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SelfScoutingVideosViewController") as! SelfScoutingVideosViewController
            guard let selfScoutingData = selfScoutingData else {return}
            vc.selfScoutingVideos = selfScoutingData
            show(vc, sender: self)
        }
    }
}
private extension WeightRoomViewController {
    func setupDelegates() {
        presenter?.delegate = self
        presenter1?.delegate = self
        presenter2?.delegate = self
        presenter3?.delegate = self
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
extension WeightRoomViewController: CalendarPresenterDelegate {
    func calendarPresenterForWeights(_ presenter: CalendarPresenter, weightData: [WeightData]) {
        
    }
    
    func calendarPresenterForGames(_ presenter: CalendarPresenter, gameData: [GameData]) {
        
    }
    
    func calendarPresenterForMedical(_ presenter: CalendarPresenter, medicalData: [MedicalData]) {
        self.medicalData = medicalData
    }
    
    func calendarPresenterForPractice(_ presenter: CalendarPresenter, practiceData: [PracticeData]) {
        
    }
}
extension WeightRoomViewController: SeflScoutingPresenterDelegate {
    func selfScoutingPresenter(_ preseneter: SeflScoutingPresenter, data: SelfScoutingData) {
        self.selfScoutingData = data
    }
    
    
}
