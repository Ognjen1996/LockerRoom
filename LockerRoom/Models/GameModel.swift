//
//  GameModel.swift
//  LockerRoom
//
//  Created by Ognjen on 8.11.22..
//

import Foundation


struct GameModel: Codable {
    var status: String
    var status_code: Int
    var message: String
    var data: MainTypesGame
}
struct MainTypesGame: Codable {
    var games: [Game]
}
struct Game: Codable {
    var id: Int
    var team_id_home: Int
    var team_id_away: Int
    var league_id: Int
    var home_result: Int
    var away_result: Int
    var finished: Int
    var game_date: String
    var created_at: String
    var updated_at: String
    var date: String
    var league: GameLeague
    var team_home: GameTeam
    var team_away: GameTeam
}
struct GameLeague: Codable {
    var id: Int
    var league_name: String
    var league_logo: String
    var created_at: String
    var updated_at: String
}
struct GameTeam: Codable {
    var id: Int
    var team_name: String
    var team_logo: String
    var created_at: String
    var updated_at: String
}

