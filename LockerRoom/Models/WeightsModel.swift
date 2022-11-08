//
//  WeightsModel.swift
//  LockerRoom
//
//  Created by Ognjen on 7.11.22..
//

struct WeightModel: Codable {
    var status: String
    var status_code: Int
    var message: String
    var data: [WeightData]
    
    
}
struct WeightData: Codable {
    var id: Int
    var name: String
    var date: String
    var user_id: Int
    var created_at: String
    var exericiseCount: Int
    var playersCount: Int
    var players: [Players]
}
struct Players: Codable {
    var id: Int
    var weight_id: Int
    var player_id: Int
    var created_at: String
    var updated_at: String
}
