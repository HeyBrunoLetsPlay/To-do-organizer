//
//  Dispatch.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

class Dispatch {
  
  static func startAppIn(_ window:UIWindow){
    SplashWireframe().present(in: window)
  }
  
  static func run(_ navigation:UINavigationController) {
    RegisterWireframe().presentWith(navigation: navigation)
  }
}
