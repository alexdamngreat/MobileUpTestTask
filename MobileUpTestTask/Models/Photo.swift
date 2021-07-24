//
//  Photo.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 22.07.2021.
//

import Foundation

// MARK: - Instruction
struct Photos: Codable {
    let response: ResponsePhoto
}

// MARK: - Response
struct ResponsePhoto: Codable {
    let count: Int
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable {
    let albumID, id, date: Int
    let text: String
    let userID: Int
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text
        case userID = "user_id"
        case sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
    }
  
  // MARK: - Size
  struct Size: Codable {
      let width, height: Int
      let url: String
      let type: String
  }
  
}



