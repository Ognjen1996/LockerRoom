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
    func calendarPResenter(_ presenter: CalendarPresenter, data: [WeightData])
}

class CalendarPresenter: UIViewController {

    weak var delegate: CalendarPresenterDelegate?
    var bearer: String = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcHAubG9ja2Vycm9vbXN5c3RlbS5jb21cL2FwaVwvYXV0aFwvbG9naW4iLCJpYXQiOjE2NjczNzg4NzUsImV4cCI6MTY2Nzk3ODg3NSwibmJmIjoxNjY3Mzc4ODc1LCJqdGkiOiI0d2RmUDQybXBxZ1RWeUdqIiwic3ViIjo0OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSIsImlkIjo0OSwibmFtZSI6IkFkbWluIiwiZW1haWwiOiJvZmZpY2VAb2N0YXNvbHV0aW9ucy5iaXoiLCJpbWFnZSI6bnVsbH0.I9mUfjTL5e36YZVpG5A3S4M41CgqDbjh7vDOov-JiuI"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func fetchData() {
        let baseURL = "https://app.lockerroomsystem.com/api/weights"
        guard let url = URL(string: baseURL) else {return}
        var request = URLRequest(url: url)
        request.method = .get
        request.headers = ["Content-Type": "application/json", "Authorization": bearer]
        
        AF.request(request).response { [weak self] response in
            guard   let self = self,
                    let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(WeightModel.self, from: data)
                let dataArray = userData.data
//                    debugPrint(userData)
                self.delegate?.calendarPResenter(self, data: dataArray)
            } catch let error {
                debugPrint(error)
            }
        }
    }
}
