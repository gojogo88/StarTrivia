//
//  Constants.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/13.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseCompletion = (Person?) -> ()
typealias HomeworldResponseCompletion = (Homeworld?) -> ()
