
import Foundation


struct WeightRoomModel: Codable {
    var status: String
    var status_code: Int
    var message: String
    var data: [WeightRoomData]
}

struct WeightRoomData: Codable {
    var id: Int
    var name: String
    var date: String
    var user_id: Int
    var created_at: String
    var updated_at: String?
    var exericiseCount: Int
    var playersCount: Int
    var players: [Players]
}


