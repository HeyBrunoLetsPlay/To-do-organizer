//
//  RegisterWireframe.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 23/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

final class RegisterWireframe {
  
  func pushWith(navigation:UINavigationController) {
    let viewController =  RegisterViewControllerBuilder.make()
    navigation.pushViewController(viewController, animated: true)
  }
}
