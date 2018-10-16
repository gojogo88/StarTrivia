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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   
  }

  @IBAction func randomBtnPressed(_ sender: Any) {
    let random = Int.random(in: 1...87) //there are 87 names in SWAPI
    //Step 1: make networking request
    personApi.getRandomPersonAlamo(id: random) { (person) in
      if let person = person {
        self.setupPersonDetails(person: person)
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
  
  @IBAction func homeworldBtnPressed(_ sender: Any) {
    
  }
  
  @IBAction func vehiclesBtnPressed(_ sender: Any) {
    
  }
  
  @IBAction func starshipsBtnPressed(_ sender: Any) {
    
  }
  
  @IBAction func filmsBtnPressed(_ sender: Any) {
    
  }
  
}

