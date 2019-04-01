//
//  UserManager.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 31/03/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation
import RealmSwift


protocol UserManagerInput {
  func fetchUser(complete:(UserEntity?)->Void)
}


class UserManager:UserManagerInput {
  
  func fetchUser(complete: (UserEntity?) -> Void) {
    
    let realmManager:RealmManager = RealmManager()
    
    if let objUser = realmManager.getObjects(type:UserEntity.self)?.first as? UserEntity {
      
      complete(objUser)
      
    }else {
      
      complete(nil)
      
    }
  }
}
