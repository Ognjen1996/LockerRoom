//
//  PlayerModel.swift
//  LockerRoom
//
//  Created by Ognjen on 1.11.22..
//

import Foundation

struct PlayerModel: Codable {
    var status: String
    var status_code: Int
    var message: String
    var data: Data
}
struct Data: Codable {
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
    var leagues: [Leagues] = []
    var user_info: Info
    var position: Position
    var total: Total
    var average: Average
    
}
struct Leagues: Codable {
    var id: Int
    var league_name: String
    var league_logo: String
    var created_at: String
    var updated_at: String
    var team_id: Int
    var league_id: Int
    var stats: Stats
}
struct Stats: Codable {
    var id: Int
    var plater_id: Int
    var league_id: Int
    var PTS: String
    var REB: String
    var AST: String
    var STL: String
    var BLK: String
    var TOV: String
    var PF: String
    var MIN: String
    var DREB: String
    var OREB: String
    var FGM: String
    var FGA: String
    var FG: String
    var PM: String
    var PA: String
    var P: String
    var FTM: String
    var FTA: String
    var FT: String
    var created_at: String
    var updated_at: String
    var GP: String
    var GS: String
}
struct Info: Codable {
    var id: Int
    var external_id: Int
    var user_id: Int
}
struct Total: Codable {
    var id: Int
    var plater_id: Int
    var PTS: String
    var REB: String
    var AST: String
    var STL: String
    var BLK: String
    var TOV: String
    var PF: String
    var MIN: String
    var DREB: String
    var OREB: String
    var FGM: String
    var FGA: String
    var FG: String
    var PM: String
    var PA: String
    var P: String
    var FTM: String
    var FTA: String
    var FT: String
    var created_at: String
    var updated_at: String
    var GP: String
    var GS: String

}
struct Average: Codable {
    var id: Int
    var plater_id: Int
    var PTS: String
    var REB: String
    var AST: String
    var STL: String
    var BLK: String
    var TOV: String
    var PF: String
    var MIN: String
    var DREB: String
    var OREB: String
    var FGM: String
    var FGA: String
    var FG: String
    var PM: String
    var PA: String
    var P: String
    var FTM: String
    var FTA: String
    var FT: String
    var created_at: String
    var updated_at: String
    var GP: String
    var GS: String
}
struct Position: Codable {
    var id: Int
    var name_small: String
    var name: String
}
