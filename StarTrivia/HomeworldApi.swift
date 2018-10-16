//
//  HomeworldApi.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/16.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import Foundation
import Alamofire

class HomeworldApi {
  
  func getHomeworld(url: String, completion: @escaping HomeworldResponseCompletion) {
    guard let url = URL(string: url) else { return }
    Alamofire.request(url).responseJSON { (response) in
      if let error = response.result.error {
        debugPrint(error.localizedDescription)
        completion(nil)
        return
      }
      
      guard let data = response.data else { return completion(nil) }
      let jsonDecoder = JSONDecoder()
      do {
        let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
        completion(homeworld)
      } catch {
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
  }
}
