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
    var data: WeightMainType
}
struct WeightMainType: Codable {
    var main_types: Weight
}
struct Weight: Codable {
    var weight: [WeightData]
}
struct WeightData: Codable {
    var id: Int
    var name: String
    var date: String
    var user_id: Int
    var created_at: String
    var typeEvent: String
    var exericise: [Excercise]
}
struct Excercise: Codable {
    var id: Int
    var weight_id: Int
    var name: String
    var comment: String?
    var sets: Int
    var reps: Int
    var weight: Int
    var user_id: Int
    var created_at: String
    var updated_at: String
}
struct Players: Codable {
    var id: Int
    var weight_id: Int
    var player_id: Int
    var created_at: String
    var updated_at: String
}
