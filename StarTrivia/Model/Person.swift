//
//  Person.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/15.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import Foundation

struct Person: Codable {
  let name: String
  let height: String
  let mass: String
  let hair: String
  let birthYear: String
  let gender: String
  let homeworldUrl: String
  let filmUrls: [String]
  let vehicleUrls: [String]
  let starshipUrls: [String]
  
  enum CodingKeys: String, CodingKey {
    case name
    case height
    case mass
    case hair = "hair_color"
    case birthYear = "birth_year"
    case gender
    case homeworldUrl = "homeworld"
    case filmUrls = "films"
    case vehicleUrls = "vehicles"
    case starshipUrls = "starships"
  }
  
  //add : Codable if the struct doesn't match the json data. Then add the enum to match the struct w/ the json data
}
