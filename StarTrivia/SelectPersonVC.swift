//
//  ViewController.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/13.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

  @IBOutlet var nameLbl: UILabel!
  @IBOutlet var heightLbl: UILabel!
  @IBOutlet var massLbl: UILabel!
  @IBOutlet var hairLbl: UILabel!
  @IBOutlet var birthYearLbl: UILabel!
  @IBOutlet var genderLbl: UILabel!
  @IBOutlet var homeworldBtn: UIButton!
  @IBOutlet var vehiclesBtn: UIButton!
  @IBOutlet var starshipsBtn: UIButton!
  @IBOutlet var filmsBtn: UIButton!
  
  var personApi = PersonApi()
  var person: Person!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   
  }

  @IBAction func randomBtnPressed(_ sender: Any) {
    let random = Int.random(in: 1...87) //there are 87 names in SWAPI
    //Step 1: make networking request
    personApi.getRandomPersonAlamo(id: random) { (person) in
      if let person = person {
        self.setupPersonDetails(person: person)
        self.person = person
      }
    }
    //
  }
  
  func setupPersonDetails(person: Person) {
    nameLbl.text = person.name
    heightLbl.text = person.height
    massLbl.text = person.mass
    hairLbl.text = person.hair
    birthYearLbl.text = person.birthYear
    genderLbl.text = person.gender
    
    if person.homeworldUrl.isEmpty {
      homeworldBtn.isEnabled = false
    } else {
      homeworldBtn.isEnabled = true
    }
    
    vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
    starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
    filmsBtn.isEnabled = !person.filmUrls.isEmpty
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if var destination = segue.destination as? PersonProtocol {
      destination.person = person
    }
    
    /* with enum
    switch segue.identifier {
    case Segue.homeworld.rawValue:
      if let destination = segue.destination as? HomeworldVC {
        destination.person = person
      }
    case Segue.vehicles.rawValue:
      if let destination = segue.destination as? VehiclesVC {
        destination.person = person
      }
    case Segue.starships.rawValue:
      if let destination = segue.destination as? StarshipsVC {
        destination.person = person
      }
    case Segue.films.rawValue:
      if let destination = segue.destination as? FilmsVC {
        destination.person = person
      }
    default:
      break
    }
 */
    
//    if segue.identifier == "toHomeworld" {
//      if let destination = segue.destination as? HomeworldVC {
//        destination.person = person
//      }
//    } else if segue.identifier == "toVehicles" {
//      if let destination = segue.destination as? VehiclesVC {
//        destination.person = person
//      }
//    } else if segue.identifier == "toStarships" {
//      if let destination = segue.destination as? StarshipsVC {
//        destination.person = person
//      }
//    } else if segue.identifier == "toFilms" {
//      if let destination = segue.destination as? FilmsVC {
//        destination.person = person
//      }
//    }
  }
  
  /*
  enum Segue: String {
    case homeworld = "toHomeworld"
    case vehicles = "toVehicles"
    case starships = "toStarships"
    case films = "toFilms"
  }
 */
}

protocol PersonProtocol {
  var person: Person! { get set }
}

