//
//  CalendarViewController.swift
//  LockerRoom
//
//  Created by Ognjen on 31.10.22..
//

import UIKit
import FSCalendar


class CalendarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var presenter: CalendarPresenter?
    var trainings: [WeightData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        presenter?.fetchData()
        presenter?.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        

    }
    
}

extension CalendarViewController : UITableViewDelegate {
    
}

extension CalendarViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CalendarTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CalendarTableViewCell") as! CalendarTableViewCell
        
        cell.setup(with: trainings, n: indexPath.row)

        return cell
    }

}

extension CalendarViewController: FSCalendarDelegate {

}
extension CalendarViewController: FSCalendarDataSource {
    
}

extension CalendarViewController: CalendarPresenterDelegate {
    func calendarPResenter(_ presenter: CalendarPresenter, data: [WeightData]) {
        self.trainings = data
        
    } 
}
