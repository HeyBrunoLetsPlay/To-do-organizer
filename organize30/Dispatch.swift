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
    // .. Lógica de apresentação
//    WelcomeWireframe().present(in:window)
      SplashWireframe().present(in: window)
  }
}
