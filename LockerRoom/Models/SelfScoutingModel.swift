//
//  SelfScoutingModel.swift
//  LockerRoom
//
//  Created by Ognjen on 16.11.22..
//

import Foundation

struct SelfScoutingModel: Codable {
    var status: String
    var status_code: Int
    var message: String
    var data: SelfScoutingData
}
struct SelfScoutingData: Codable {
    var id: Int
    var name: String
    var created_at: String
    var updated_at: String
    var players: [ScoutingPlayers]
    var videos: [ScoutingVideos]
}
struct ScoutingPlayers: Codable {
    var id: Int
    var external_player_id: Int
    var category_id: Int
    var created_at: String
    var updated_at: String
    var players: [PlayersData]
}
struct PlayersData: Codable {
    var id: Int
    var team_id: Int
    var first_name: String
    var last_name: String
    var position_id: Int
    var jersey_number: Int
    var height: String
    var weight: String
    var age: Int
    var player_image: String
}
struct ScoutingVideos: Codable {
    var id: Int
    var title: String
    var comment: String
    var user_id: Int
    var category_id: Int
    var video: String
    var created_at: String
    var updated_at: String
}
