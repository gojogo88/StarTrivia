//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/16.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {

  var person: Person!
  let api = VehicleApi()
  
  @IBOutlet var nameLbl: UILabel!
  @IBOutlet var modelLbl: UILabel!
  @IBOutlet var manufacturerLbl: UILabel!
  @IBOutlet var costLbl: UILabel!
  @IBOutlet var lengthLbl: UILabel!
  @IBOutlet var speedLbl: UILabel!
  @IBOutlet var crewLbl: UILabel!
  @IBOutlet var passengersLbl: UILabel!
  @IBOutlet var previousBtn: UIButton!
  @IBOutlet var nextBtn: UIButton!
  
  var vehicles = [String]()
  var currentVehicle = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
    vehicles = person.vehicleUrls
    nextBtn.isEnabled = vehicles.count > 1
    previousBtn.isEnabled = false
    guard let firstVehicle = vehicles.first else { return }
    getVehicle(url: firstVehicle)
  }
  
  func getVehicle(url: String) {
    api.getVehicle(url: url) { (vehicle) in
      if let vehicle = vehicle {
        self.setupVehicleUi(vehicle: vehicle)
      }
    }
  }
  
  func setupVehicleUi(vehicle: Vehicle) {
    nameLbl.text = vehicle.name
    modelLbl.text = vehicle.model
    manufacturerLbl.text = vehicle.manufacturer
    costLbl.text = vehicle.cost
    lengthLbl.text = vehicle.length
    speedLbl.text = vehicle.speed
    crewLbl.text = vehicle.crew
    passengersLbl.text = vehicle.passengers
  }
    
  @IBAction func previousBtnPressed(_ sender: Any) {
    currentVehicle -= 1
    setButtonState()
  }
  
  @IBAction func nextBtnPressed(_ sender: Any) {
    currentVehicle += 1
    setButtonState()
  }
  

  func setButtonState() {
    previousBtn.isEnabled = currentVehicle == 0 ? false : true
    nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
    
    /*
    if currentVehicle == 0 {
      previousBtn.isEnabled = false
    } else {
      previousBtn.isEnabled = true
    }
    
    if currentVehicle == vehicles.count - 1 {
      nextBtn.isEnabled = false
    } else {
      nextBtn.isEnabled = true
    }
    */
    
    getVehicle(url: vehicles[currentVehicle])
  }
}
