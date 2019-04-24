//
//  RegisterViewController.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 23/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.backgroundImageView.addBlur()
  }
}
