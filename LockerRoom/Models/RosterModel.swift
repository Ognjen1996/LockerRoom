//
//  RosterModel.swift
//  LockerRoom
//
//  Created by Ognjen on 17.11.22..
//

import Foundation

struct RosterModel: Codable {
    var status: String
    var status_code: Int
    var message: String
    var data: RosterData
}
struct RosterData: Codable {
    var id: Int
    var team_name: String
    var team_logo: String
    var created_at: String
    var updated_at: String
    var players: [RosterPlayers]
}
struct RosterPlayers: Codable {
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
    var position: Position
    var average: Average?
}

