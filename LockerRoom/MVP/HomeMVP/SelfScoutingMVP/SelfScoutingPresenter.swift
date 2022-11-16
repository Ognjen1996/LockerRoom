//
//  SelfScoutingPresenter.swift
//  LockerRoom
//
//  Created by Ognjen on 16.11.22..
//

import Foundation
import Alamofire


protocol SeflScoutingPresenterDelegate: AnyObject {
    func selfScoutingPresenter(_ preseneter: SeflScoutingPresenter, data: SelfScoutingData )
}

class SeflScoutingPresenter { 
    
    weak var delegate: SeflScoutingPresenterDelegate?
    var user: Login
    var bearer: String = "Bearer "
    
    init(user: Login) {
        self.user = user
        self.bearer += user.access_token
    }
    
    func fetchData() {
        let baseURL = "https://app.lockerroomsystem.com/api/self-scouting/17"
        guard let url = URL(string: baseURL) else {return}
        var request = URLRequest(url: url)
        request.method = .get
        request.headers = ["Content-Type": "application/json", "Authorization": bearer]
        AF.request(request).response { [weak self] response in
            
            guard let self = self,
                  let data = response.data
            else {return}
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(SelfScoutingModel.self, from: data)
                self.delegate?.selfScoutingPresenter(self, data: userData.data)
            } catch let error {
                debugPrint(error)
            }
            
        }
    }
}
