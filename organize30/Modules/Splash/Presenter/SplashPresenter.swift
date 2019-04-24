//
//  SplashPresenter.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 21/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation


protocol SplashPresenterInput {
  func viewDidLoad()
}

class SplashPresenter:SplashPresenterInput {
  
  let wireframe:SplashWireframe
  
  private init(wireframe:SplashWireframe) {
    self.wireframe = wireframe
  }
  
  static func builder(wireframe:SplashWireframe)-> SplashPresenterInput{
    let splash = SplashPresenter.init(wireframe:wireframe)
    return splash
  }
  
  func viewDidLoad() {
    _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: false)
  }
  
  @objc func runTimedCode(){
   // self.wireframe
  }
}
