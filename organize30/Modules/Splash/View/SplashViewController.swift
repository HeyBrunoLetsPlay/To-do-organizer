//
//  SplashViewController.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 19/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  var presenter:SplashPresenterInput?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Organize 30"
    self.backgroundImageView.addBlur()
    self.presenter?.viewDidLoad()
  }
}
