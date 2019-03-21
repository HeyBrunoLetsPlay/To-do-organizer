//
//  ProfilePhotoManager.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 26/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

protocol ProfilePhotoManagerInput {
  func numberOfImages()
}

protocol ProfilePhotoManagerOutput:class {
  func fetchedNumber(of images:Int)
}


class ProfilePhotoManager:ProfilePhotoManagerInput {
  
  weak var output:ProfilePhotoManagerOutput?
  private var images:[String] = [String]() 
  
  init() {
    let imageName = "PhtoCell"
    for i in 0 ... 20 {
      self.images.append("\(imageName)\(i)")
    }
  }
  
  
  
  func numberOfImages() {
    self.output?.fetchedNumber(of:self.images.count)
    
  }
}
