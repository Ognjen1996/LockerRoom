//
//  MedicalModel.swift
//  LockerRoom
//
//  Created by Ognjen on 8.11.22..
//

import Foundation


struct MedicalModel: Codable {
    var status: String
    var status_code: Int
    var message: String
    var data: MedicalMainType
}
struct MedicalMainType: Codable {
    var main_types: Medical
}
struct Medical: Codable {
    var medical: [MedicalData]
    var film: [MedicalData]
}
struct MedicalData: Codable {
    var id: Int
    var event_type: Int
    var name: String
    var event_date: String
    var user_id: Int
    var comment: String
    var created_at: String?
    var updated_at: String?
    var date: String
    var typeEvent: String
    var type: MedicalType
    var players: [MedicalPlayers]
}
struct MedicalType: Codable {
    var id: Int
    var name: String
    var slug: String
    var created_at: String?
    var updated_at: String?
}
struct MedicalPlayers: Codable {
    var id: Int
    var event_id: Int
    var player_id: Int
    var created_at: String
    var updated_at: String
    var player: MedicalPlayer?
}
struct MedicalPlayer: Codable {
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
