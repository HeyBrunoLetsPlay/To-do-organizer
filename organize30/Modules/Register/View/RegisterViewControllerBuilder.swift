//
//  RegisterViewControllerBuilder.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 23/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

final class RegisterViewControllerBuilder {
  
  static func make() -> RegisterViewController {
    let viewController = RegisterViewController.init(nibName: "RegisterViewController", bundle: nil)
    return viewController
  }
  
}
