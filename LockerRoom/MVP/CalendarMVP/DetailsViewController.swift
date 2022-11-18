//
//  DetailsViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 10.11.22..
//

import UIKit

class DetailsViewController: UIViewController {

    var weightRoomData: WeightRoomData?
    var selfScoutingVideos: SelfScoutingData?
    var selectedWeight: WeightData?
    var selectedGame: GameData?
    var selectedMedical: MedicalData?
    var selectedPractice: PracticeData?
    var flag: Int?
//    var isOpenedFormCalendar: Bool = true
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}
extension DetailsViewController: UITableViewDelegate {
    
}
extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if flag == 4 {
            guard let exercises = selectedWeight?.exericise else {return 0}
            return exercises.count
        }
//        if flag == 2 {
//            guard let drills = selectedPractice?.drill else {return 1}
//            return drills.count
//        }
        else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
        if flag == 1 {
            if let selectedGame = selectedGame {
                cell.setupGames(with: selectedGame, n: indexPath.row)
                cell.isUserInteractionEnabled = false
                return cell
            }
        }
        if flag == 2 {
            if let selectedPractice = selectedPractice {
                cell.setupPractice(with: selectedPractice, n: indexPath.row)
                cell.isUserInteractionEnabled = false
                return cell
            }
        }

        if flag == 3 {
            if let selectedMedical = selectedMedical {
                cell.setupMedical(with: selectedMedical, n: indexPath.row)
                cell.isUserInteractionEnabled = false
                return cell
            }
        }
        if flag == 4 {
            if let selectedWeight = selectedWeight {
                cell.setupWeights(with: selectedWeight, n: indexPath.row)
                cell.isUserInteractionEnabled = false
                return cell
            }
        }
        if flag == 5 {
            if let weightRoomData = weightRoomData {
                cell.setupWeightroom(with: weightRoomData, n: indexPath.row)
                cell.isUserInteractionEnabled = false
            }
            return cell
        }
        if flag == 6 {
            if let selectedPractice  = selectedPractice {
                cell.setupPractice(with: selectedPractice, n: indexPath.row)
                cell.isUserInteractionEnabled = false
            }
            return cell
        }
        return cell
    }
    
    
}
