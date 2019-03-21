//
//  WelcomeViewControllerBuilder.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

final class WelcomeViewControllerBuilder{
  
  static func make(wireframe:WelcomeWireframe)->WelcomeViewController{
    let viewController =  WelcomeViewController.init(nibName:"WelcomeViewController", bundle:nil)
    viewController.sections = [WelcomeHeaderSectionBuilder.make(), WelcomePhotoSectionBuilder.make()]
    return viewController
  }
}
