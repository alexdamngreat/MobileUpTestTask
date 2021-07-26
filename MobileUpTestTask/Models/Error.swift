//
//  Error.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 25.07.2021.
//

import Foundation

struct Errors: Codable {
  let response: Error
}

struct ErrorResponse: Codable {
  let count: Int
  let error: [Error]
}

// MARK: - Error
struct Error: Codable {
  let errorCode: Int
  let requestParams: [RequestParam]
  let errorMsg: String
  
  enum CodingKeys: String, CodingKey {
    case errorCode = "error_code"
    case requestParams = "request_params"
    case errorMsg = "error_msg"
  }
}

// MARK: - RequestParam
struct RequestParam: Codable {
  let key, value: String
}
