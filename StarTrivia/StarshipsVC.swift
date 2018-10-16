//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/16.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {

  var person: Person!
  let api = StarshipApi()

  @IBOutlet var nameLbl: UILabel!
  @IBOutlet var modelLbl: UILabel!
  @IBOutlet var makerLbl: UILabel!
  @IBOutlet var costLbl: UILabel!
  @IBOutlet var lengthLbl: UILabel!
  @IBOutlet var speedLbl: UILabel!
  @IBOutlet var crewLbl: UILabel!
  @IBOutlet var passengersLbl: UILabel!
  @IBOutlet var hyeprdriveLbl: UILabel!
  @IBOutlet var classLbl: UILabel!
  @IBOutlet var previousBtn: FadeEnabledButton!
  @IBOutlet var nextBtn: FadeEnabledButton!
  
  var starships = [String]()
  var currentStarship = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()

    starships = person.starshipUrls
    nextBtn.isEnabled = starships.count > 1
    previousBtn.isEnabled = false
    guard let firstStarship = starships.first else { return }
    getStarship(url: firstStarship)
  }
  
  func getStarship(url: String) {
    api.getStarship(url: url) { (starship) in
      if let starship = starship {
        self.setupStarshipUi(starship: starship)
      }
    }
  }
  
  func setupStarshipUi(starship: Starship) {
    nameLbl.text = starship.name
    modelLbl.text = starship.model
    makerLbl.text = starship.manufacturer
    costLbl.text = starship.cost
    lengthLbl.text = starship.length
    speedLbl.text = starship.speed
    crewLbl.text = starship.crew
    passengersLbl.text = starship.passengers
    hyeprdriveLbl.text = starship.hyperdrive
    classLbl.text = starship.starshipClass
    
  }
  
  
  @IBAction func previousBtnPressed(_ sender: Any) {
    currentStarship -= 1
    setButtonState()
  }
  
  @IBAction func nextBtnPressed(_ sender: Any) {
    currentStarship += 1
    setButtonState()
  }
  
  func setButtonState() {
    previousBtn.isEnabled = currentStarship == 0 ? false : true
    nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
  
    getStarship(url: starships[currentStarship])
  }
  
}
