//
//  LoginModel.swift
//  LockerRoom
//
//  Created by Ognjen on 28.10.22..
//

import Foundation

struct LoginRequestModel: Codable {
    var email: String
    var password: String
    var mobile: String
}

struct Login: Codable {
    var access_token: String
    var token_type: String
    var user: User
    var team: Team
}
struct User: Codable {
    var email: String
    var name: String
    var external_id: Int?
    var image: String?
}

struct Team: Codable {
    var id: Int
    var team_name: String
    var team_logo: String
    var leagues: [League] = []
}

struct League: Codable {
    var id: Int
    var league_name: String
    var league_logo: String
    var pivot: Pivot
}

struct Pivot: Codable {
    var team_id: Int
    var league_id: Int
}
