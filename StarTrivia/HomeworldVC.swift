//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/16.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {

  var person: Person!
  let api = HomeworldApi()
  
  @IBOutlet var nameLbl: UILabel!
  @IBOutlet var climateLbl: UILabel!
  @IBOutlet var terrainLbl: UILabel!
  @IBOutlet var populationLbl: UILabel!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      api.getHomeworld(url: person.homeworldUrl) { (homeworld) in
        if let homeworld = homeworld {
          self.setupHomeworldUi(homeworld: homeworld)
        }
      }
    }
    

  func setupHomeworldUi(homeworld: Homeworld) {
    nameLbl.text = homeworld.name
    climateLbl.text = homeworld.climate
    terrainLbl.text = homeworld.terrain
    populationLbl.text = homeworld.population
  }

}
