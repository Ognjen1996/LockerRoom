
import Foundation
import Alamofire

protocol WeightRoomPresenterDelegate: AnyObject {
    func weightRoomPresenter(_ presenter: WeightRoomPresenter, data: [WeightRoomData])
}

class WeightRoomPresenter {
    
    var bearer: String = "Bearer "
//    var user: Login
    weak var delegate: WeightRoomPresenterDelegate?
    
    
//    init(user: Login) {
//        self.user = user
//        self.bearer += user.access_token
//    }
    
    func fethcData() {
        let baseURL = "https://app.lockerroomsystem.com/api/weights"
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
                let userData = try decoder.decode(WeightRoomModel.self, from: data)
                self.delegate?.weightRoomPresenter(self, data: userData.data)
                
            } catch let error {
                debugPrint(error)
            }
            
        }
    }
}
