//
//  Session.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 22.07.2021.
//

import Foundation

final class Session: NSObject {
  static let shared = Session()
  
  override init() {}
  
  var token = ""
}
