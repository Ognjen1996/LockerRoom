//
//  GamePlanModel.swift
//  LockerRoom
//
//  Created by Ognjen on 14.11.22..
//

import Foundation


struct PlaybookModel: Codable {
    var status: String
    var status_code: Int
    var message: String
    var data: [PlaybookData]
}
struct PlaybookData: Codable {
    var id: Int
    var name: String
    var fixture_id: Int?
    var general_comment: String
    var created_at: String
    var updated_at: String
    var imageCount: Int
    var seenCount: Int
    var play_book_sub_category: [PlaybookSubCategory]
    var user: Int?
}
struct PlaybookSubCategory: Codable {
    var id: Int
    var name: String
    var play_book_id: Int
    var general_comment: String
    var created_at: String
    var updated_at: String
    var images: [Images]
}
struct Images: Codable {
    var id: Int
    var play_book_sub_cat_id: Int
    var file_name: String
    var file_path: String
    var mime: String
    var original_filename: String
    var comment: String
    var user_id: Int
    var created_at: String
    var updated_at: String
    var user_created: String?
}
