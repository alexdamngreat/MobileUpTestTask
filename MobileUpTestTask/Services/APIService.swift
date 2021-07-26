//
//  APIService.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 22.07.2021.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

class APIVkontakte {
  let baseURL = "https://api.vk.com/method"
  let token = Session.shared.token
  let groupID = "-128666765"
  let version = "5.77"
  
  func getGroupPhotos(complition: @escaping([Photo]) -> ()) {
    
    let method = "/photos.get"
    let parameters: Parameters = [
      "owner_id": groupID,
      "album_id": "266276915",
      "rev": 0,
      "photo_sizes": 0,
      "access_token": Session.shared.token,
      "v": version
    ]
    let url = baseURL + method
    
    AF.request(url, method: .get, parameters: parameters).responseData { response in
      
      guard let data = response.data else { return }
      guard let photoResponse = try? JSONDecoder().decode(Photos.self, from: data) else { return }
      
      let photos = photoResponse.response.items
      print(data.prettyJSON as Any)
      DispatchQueue.main.async {
        complition(photos)
      }
    }
  }
}

extension Data {
  
  var prettyJSON: NSString? {
    guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
          let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
          let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
    
    return prettyPrintedString
  }
}

