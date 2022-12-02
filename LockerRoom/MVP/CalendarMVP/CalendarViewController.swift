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
    
    
    var flag = 1
    var dateOfGames: [String] = []
    var dateOfPractices: [String] = []
    var dateOfMedicals: [String] = []
    var dateOfWeights: [String] = []

    
    
    var presenter: CalendarPresenter?
    var weights: [WeightData]? = [] {
        didSet {
            tableView.reloadData()
            events()
        }
    }
    var practices: [PracticeData]? = [] {
        didSet {
            tableView.reloadData()
            events()
        }
    }
    var games: [GameData]? = [] {
        didSet {
            tableView.reloadData()
            events()
        }
    }
    var medicals: [MedicalData]? = [] {
        didSet {
            tableView.reloadData()
            events()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        presenter?.fetchData(for: "1")
        presenter?.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        

    }
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    private func events() {
        guard let games = games else {return}
        for game in games {
            let dates = game.date.split(separator: " ")
            dateOfGames.append(String(dates[0]))
        }
        guard let weights = weights else {return}
        for weight in weights {
            let dates = weight.date.split(separator: " ")
            dateOfWeights.append(String(dates[0]))
        }
        guard let practices = practices else {return}
        for practice in practices {
            let dates = practice.date.split(separator: " ")
            dateOfPractices.append(String(dates[0]))
        }
        guard let medicals = medicals else {return}
        for medical in medicals {
            let dates = medical.date.split(separator: " ")
            dateOfMedicals.append(String(dates[0]))
        }
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
            UIAction(title: "Practice", state: .off, handler: practiceOptionClosure),
            UIAction(title: "Games", state: .on, handler: gamesOptionClosure),
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboad = UIStoryboard(name: "Calendar", bundle: nil)
        let vc = storyboad.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        if flag == 1 {
            if let games = self.games {
                let selected = games[indexPath.row]
                vc.flag = flag
                vc.selectedGame = selected
                show(vc, sender: self)
            }
        }
        if flag == 2 {
            if let practices = self.practices {
                let selected = practices[indexPath.row]
                vc.flag = flag
                vc.selectedPractice = selected
                show(vc, sender: self)
            }
        }
        if flag == 3 {
            if let medicals = self.medicals {
                let selected = medicals[indexPath.row]
                vc.flag = flag
                vc.selectedMedical = selected
                show(vc, sender: self)
            }
        }
        if flag == 4 {
            if let weights = self.weights {
                let selected = weights[indexPath.row]
                vc.flag = flag
                vc.selectedWeight = selected
                show(vc, sender: self)
            }
        }
    }
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
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.dateFormatter2.string(from: date)
        switch flag {
        case 1:
            if self.dateOfGames.contains(dateString) {
            return 1
        }
        case 2:
            if self.dateOfPractices.contains(dateString) {
            return 1
        }
        case 3:
            if self.dateOfMedicals.contains(dateString) {
            return 1
        }
        case 4:
            if self.dateOfWeights.contains(dateString) {
            return 1
        }
        default:
            return 0
        }
        return 0
    }
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
