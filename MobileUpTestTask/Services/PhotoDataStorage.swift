//
//  PhotoDataStorage.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 23.07.2021.
//

import Foundation

final class PhotoDataStorage: NSObject {
  static let shared = PhotoDataStorage()
  
  override init() {}
  
  var photos = [Photo]()
}
