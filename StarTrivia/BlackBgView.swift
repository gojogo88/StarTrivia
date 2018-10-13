//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Jonathan Go on 2018/10/13.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
  
  override func awakeFromNib() {
    layer.backgroundColor = BLACK_BG
    layer.cornerRadius = 10
  }
}

class BlackBgButton: UIButton {
  override func awakeFromNib() {
    layer.backgroundColor = BLACK_BG
    layer.cornerRadius = 10
  }
}
