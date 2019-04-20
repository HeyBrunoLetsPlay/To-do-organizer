//
//  SplashViewControllerBuilder.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 20/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

final class SplashViewControllerBuilder {
  
  static func make()->SplashViewController {
    let viewController = SplashViewController.init(nibName: "SplashViewController", bundle: nil)
    return viewController
  }
  
}

