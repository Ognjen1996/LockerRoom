//
//  DetailsViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 10.11.22..
//

import UIKit

class DetailsViewController: UIViewController {


    var selectedWeight: WeightData?
    var selectedGame: GameData?
    var selectedMedical: MedicalData?
    var selectedPractice: PracticeData?
    var flag: Int?
    
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
        guard let exercises = selectedWeight?.exericise else {return 0}
        return exercises.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
        if flag == 4 {
            if let selectedWeight = selectedWeight {
                cell.setupWeights(with: selectedWeight, n: indexPath.row)
                return cell
            }
        }
        return cell
    }
    
    
}
