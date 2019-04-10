//
//  UserManagerMock.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 09/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation
@testable import organize30

final class UserManagerMock:UserManagerInput {
  
  var isFailed:Bool
  
  init(failed:Bool) {
    self.isFailed = failed
  }
  
  func fetchUser(complete: (UserEntity?) -> Void) {
    
    if isFailed {
      complete(nil)
    }else {
     
      complete(UserEntity.init(id: 0, image: "Bruno.jpg", name: "Bruno", genre: "Masculino"))
      
    }
  }
  
  func saveUserWith(image: String, name: String, genre: String) {}
}
