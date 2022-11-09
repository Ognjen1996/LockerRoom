//
//  HomePresenter.swift
//  LockerRoom
//
//  Created by Ognjen on 31.10.22..
//

import UIKit
import Alamofire
import SwiftyJSON

protocol CalendarPresenterDelegate: AnyObject {
    func calendarPresenterForWeights(_ presenter: CalendarPresenter, weightData: [WeightData])
    func calendarPresenterForGames(_ presenter: CalendarPresenter, gameData: [GameData])
    func calendarPresenterForMedical(_ presenter: CalendarPresenter, medicalData: [MedicalData])
    func calendarPresenterForPractice(_ presenter: CalendarPresenter, practiceData: [PracticeData])
}

class CalendarPresenter {

    var user: Login
    weak var delegate: CalendarPresenterDelegate?
    var bearer: String = "Bearer "
    
    init(user: Login) {
        self.user = user
        self.bearer += user.access_token
    }
    
    func fetchData(for type: String) {
        let baseURL = "https://app.lockerroomsystem.com/api/calendar/\(type)"
        guard let url = URL(string: baseURL) else {return}
        var request = URLRequest(url: url)
        request.method = .get
        request.headers = ["Content-Type": "application/json", "Authorization": bearer]
        
        AF.request(request).response { [weak self] response in
            guard   let self = self,
                    let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                
                if type == "4" {
                    let userData = try decoder.decode(WeightModel.self, from: data)
                    let dataArray = userData.data.main_types.weight
                    self.delegate?.calendarPresenterForWeights(self, weightData: dataArray)
                }
                if type == "3" {
                    let userData = try decoder.decode(MedicalModel.self, from: data)
                    let dataArray = userData.data.main_types.medical
                    self.delegate?.calendarPresenterForMedical(self, medicalData: dataArray)

                }
                if type == "2" {
                    let userData = try decoder.decode(PracticeModel.self, from: data)
                    let dataArray = userData.data.main_types.practice
                    self.delegate?.calendarPresenterForPractice(self, practiceData: dataArray)
                }
                if type == "1" {
                    let userData = try decoder.decode(GameModel.self, from: data)
                    let dataArray = userData.data.main_types.games
                    self.delegate?.calendarPresenterForGames(self, gameData: dataArray)
                }
            } catch let error {
                debugPrint(error)
            }
        }
    }
}
