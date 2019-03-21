//
//  WelcomeWireframe.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

final class WelcomeWireframe {
  var viewController:WelcomeViewController?
  var navigationController:UINavigationController?
  
  func present(in window:UIWindow) {
    self.viewController = WelcomeViewControllerBuilder.make(wireframe:self)
    guard let controller = self.viewController else {
      return
    }
    
    self.navigationController = UINavigationController(rootViewController:controller)
    guard let navigation = self.navigationController else {
      return
    }
    
    window.rootViewController = navigation
  }
  
}
