//
//  ProfileImageHelperInteractor.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 21/03/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

protocol ProfileImageHelperInteractorInput {
  
  func imagesCount()
  func imageNameIn(index:Int, complete:(String)->Void)
  
}

protocol ProfileImageHelperInteractorOutput: class {
  
  func number(images:Int)
  
}


final class ProfileImageHelperInteractor:ProfileImageHelperInteractorInput {
  
  weak var output:ProfileImageHelperInteractorOutput?
  private var images:[String] = [String]()
  
  
  init() {
    
    let imageName = "PhtoCell"
    for i in 0 ... 20 {
      
      self.images.append("\(imageName)\(i)")
      
    }
    
  }
  
  
  func imagesCount() {
    
    self.output?.number(images: self.images.count)
    
  }
  
  func imageNameIn(index:Int, complete:(String)->Void) {
    
    complete(self.images[index])
    
  }
  
}
