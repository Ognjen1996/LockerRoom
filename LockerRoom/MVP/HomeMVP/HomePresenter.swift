//
//  HomePresenter.swift
//  LockerRoom
//
//  Created by Ognjen on 31.10.22..
//

import UIKit
import Alamofire
import SwiftyJSON

protocol HomePresenenterDelegate: AnyObject {
    func homePresenter(_ presenter: HomePresenter, data: PlayerModel )
}

class HomePresenter {

    weak var delegate: HomePresenenterDelegate?
    var user: Login
    var bearer: String = "Bearer "
    
    init(user: Login) {
        self.user = user
        self.bearer += user.access_token
    }
    
    func fetchData() {
        let baseURL = "https://app.lockerroomsystem.com/api/player/1"
        guard let url = URL(string: baseURL) else {return}
        var request = URLRequest(url: url)
        request.method = .get
        request.headers = ["Content-Type": "application/json", "Authorization": bearer]
        
        AF.request(request).response { [weak self] response in
            guard   let self = self,
                    let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(PlayerModel.self, from: data)
                self.delegate?.homePresenter(self, data: userData)
            } catch let error {
                debugPrint(error)
            }
        }
    }
}
