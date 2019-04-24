//
//  SplashWireframe.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 20/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

final class SplashWireframe {
  
  var viewController:SplashViewController?
  var navigationController:UINavigationController?
  
  func present(in window:UIWindow) {
    
    self.viewController = SplashViewControllerBuilder.make(self)
    
    guard let controller = self.viewController else {
      return
    }
    
    self.navigationController = UINavigationController(rootViewController:controller)
    guard let navigation = self.navigationController else {
      return
    }
    
    window.rootViewController = navigation
  }
  
  func dispatch() {
    Dispatch.root()
  }
}
