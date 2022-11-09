//
//  Practice Model.swift
//  LockerRoom
//
//  Created by Ognjen on 8.11.22..
//

import Foundation


struct PracticeModel: Codable{
    var status: String
    var status_code: Int
    var message: String
    var data: MainTypes
}
struct MainTypes: Codable {
    var main_types: Practice
}
struct Practice: Codable {
    var practice: [PracticeData]
}
struct PracticeData: Codable {
    var id: Int
    var name: String
    var date: String
    var user_id: Int
    var created_at: String
    var typeEvent: String
    var drill: [String]
}
