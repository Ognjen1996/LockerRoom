
import Foundation
import Alamofire

protocol PracticeRoomPresenterDelegate: AnyObject {
    func practiceRoomPresenter(_ presenter: PracticeRoomPresenter, data: [PracticeData])
}

class PracticeRoomPresenter {
    
    var bearer: String = "Bearer "
    var user: Login
    weak var delegate: PracticeRoomPresenterDelegate?
    
    
    init(user: Login) {
        self.user = user
        self.bearer += user.access_token
    }
    
    func fetchData() {
        let baseURL = "https://app.lockerroomsystem.com/api/calendar/2"
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
                let userData = try decoder.decode(PracticeModel.self, from: data)
                let dataArray = userData.data.main_types.practice
                self.delegate?.practiceRoomPresenter(self, data: dataArray)
                
            } catch let error {
                debugPrint(error)
            }
            
        }
    }
}
