

import Foundation
import Alamofire


protocol RosterPresenterDelegate: AnyObject {
    func rosterPresenter(_ presenter: RosterPresenter, data: RosterData)
}

class RosterPresenter {
    var user: Login
    var bearer: String = "Bearer "
    weak var delegate: RosterPresenterDelegate?
    
    init(user: Login) {
        self.user = user
        self.bearer += user.access_token
    }
    
    func fetchRosterData() {
        let baseURL = "https://app.lockerroomsystem.com/api/team/1"
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
                let userData = try decoder.decode(RosterModel.self, from: data)
                self.delegate?.rosterPresenter(self, data: userData.data)
            } catch let error {
                debugPrint(error)
            }
            
        }
    }
}
