//
//  FadeEnabledButton.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/16.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class FadeEnabledButton: UIButton {
  
  override var isEnabled: Bool {
    didSet {
      if isEnabled {
        UIView.animate(withDuration: 0.4) {
          self.alpha = 1.0
        }
      } else {
        UIView.animate(withDuration: 0.4) {
          self.alpha = 0.5
        }
      }
    }
  }
}
