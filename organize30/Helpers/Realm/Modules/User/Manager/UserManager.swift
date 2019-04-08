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
  func saveUserWith(image:String, name:String, genre:String)
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
  
  func saveUserWith(image: String, name: String, genre: String) {
    
    let realmManager = RealmManager()
    
    if let objUser = realmManager.getObjects(type: UserEntity.self)?.first as? UserEntity {
      
      let editUser = UserEntity.init(id: objUser.id, image:image, name:name, genre:genre)
      
      realmManager.editObjects(objs: editUser)
      
    } else {
      
      let id = realmManager.incrementID(type: UserEntity.self)
      let obj = UserEntity.init(id: id, image: image, name: name, genre: genre)
      realmManager.saveObjects(objs: obj)
      
    }
  }
}
