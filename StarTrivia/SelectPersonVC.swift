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
  
  
  var personApi = PersonApi()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
   
  }

  @IBAction func randomBtnPressed(_ sender: Any) {
    let random = Int.random(in: 1...87) //there are 87 names in SWAPI
    //Step 1: make networking request
    personApi.getRandomPersonAlamo(id: random) { (person) in
      if let person = person {
        self.nameLbl.text = person.name
        self.heightLbl.text = person.height
        self.massLbl.text = person.mass
        self.hairLbl.text = person.hair
        self.birthYearLbl.text = person.birthYear
        self.genderLbl.text = person.gender
      }
    }
    //
  }
  
}

