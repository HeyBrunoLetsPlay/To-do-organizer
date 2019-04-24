//
//  SplashViewControllerBuilder.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 20/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

final class SplashViewControllerBuilder {
  
  static func make(_ wireframe:SplashWireframe)->SplashViewController {
    
    let viewController = SplashViewController.init(nibName: "SplashViewController", bundle: nil)
    
    let presenter = SplashPresenter.builder(wireframe: wireframe)
    
    viewController.presenter = presenter
    
    return viewController
  }
  
}

