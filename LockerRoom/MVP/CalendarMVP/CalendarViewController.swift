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
    @IBOutlet weak var menuButton: UIButton!
    var flag = 2

    var presenter: CalendarPresenter?
    var weights: [WeightData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var practices: [PracticeData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var games: [GameData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var medicals: [MedicalData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        tableView.backgroundColor = .black
        presenter?.fetchData(for: "2")
        presenter?.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        

    }
    
    private func setupButton() {

        let weightOptionClosure = { (action: UIAction) in
            if let presenter = self.presenter {
                presenter.fetchData(for: "4")
                self.flag = 4
            }
        }
        let medicalOptionClosure = { (action: UIAction) in
            if let presenter = self.presenter {
                presenter.fetchData(for: "3")
                self.flag = 3
            }
        }
        let practiceOptionClosure = { (action: UIAction) in
            if let presenter = self.presenter {
                presenter.fetchData(for: "2")
                self.flag = 2
            }
        }
        let gamesOptionClosure = { (action: UIAction) in
            if let presenter = self.presenter {
                presenter.fetchData(for: "1")
                self.flag = 1
            }
        }
        menuButton.menu = UIMenu(children: [
            UIAction(title: "Weight", state: .off, handler: weightOptionClosure),
            UIAction(title: "Practice", state: .on, handler: practiceOptionClosure),
            UIAction(title: "Games", state: .off, handler: gamesOptionClosure),
            UIAction(title: "Medical", state: .off, handler: medicalOptionClosure),
        ])
        
        if #available(iOS 15.0, *) {
            menuButton.changesSelectionAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
        menuButton.showsMenuAsPrimaryAction = true
    }
}

extension CalendarViewController : UITableViewDelegate {
    
}

extension CalendarViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var niz = 2
        if flag == 4 {
            guard let weights = weights else {return niz}
            niz = weights.count
            return niz
        }
        if flag == 3 {
            guard let medicals = medicals else {return niz}
            niz = medicals.count
            return niz
        }
        if flag == 2 {
            guard let practices = practices else {return niz}
            niz = practices.count
            return niz
        }
        if flag == 1 {
            guard let games = games else {return niz}
            niz = games.count
            return niz
        }
        return niz
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CalendarTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CalendarTableViewCell") as! CalendarTableViewCell
        guard let weights = weights else {return cell}
        if flag == 4 {
            cell.setupWeights(with: weights, n: indexPath.row)
            return cell
        }
        guard let medicals = medicals else {return cell}
        if flag == 3 {
            cell.setupMedicals(with: medicals, n: indexPath.row)
            return cell
        }
        guard let practices = practices else {return cell}
        if flag == 2 {
            cell.setupPractice(with: practices, n: indexPath.row)
            return cell
        }
        guard let games = games else {return cell}
        if flag == 1 {
            cell.setupGame(with: games, n: indexPath.row)
            return cell
        }
        return cell
    }

}

extension CalendarViewController: FSCalendarDelegate {

}
extension CalendarViewController: FSCalendarDataSource {
    
}

extension CalendarViewController: CalendarPresenterDelegate {
    func calendarPresenterForWeights(_ presenter: CalendarPresenter, weightData: [WeightData]) {
        self.weights = weightData
    }
    
    func calendarPresenterForGames(_ presenter: CalendarPresenter, gameData: [GameData]) {
        self.games = gameData
    }
    
    func calendarPresenterForMedical(_ presenter: CalendarPresenter, medicalData: [MedicalData]) {
        self.medicals = medicalData
    }
    
    func calendarPresenterForPractice(_ presenter: CalendarPresenter, practiceData: [PracticeData]) {
        self.practices = practiceData
    }
}
