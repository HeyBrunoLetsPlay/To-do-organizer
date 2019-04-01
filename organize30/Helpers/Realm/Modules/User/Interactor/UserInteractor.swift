//
//  UserManager.swift
//  Quadro Organizacional
//
//  Created by user on 05/10/2018.
//  Copyright © 2018 Bruno Raphael Castilho de Freitas. All rights reserved.
//
import Foundation
import RealmSwift

//class UserManager {
//    func save(image:String, name:String, genre:String){
//        let realmManager = RealmManager()
//        if let objUser = realmManager.getObjects(type:UserEntity.self)?.first as? UserEntity {
//            let editUser = UserEntity.init(id:objUser.id, image:image, name:name, genre:genre)
//            realmManager.editObjects(objs:editUser)
//        }else {
//            let id = realmManager.incrementID(type:UserEntity.self)
//            let obj = UserEntity.init(id:id, image:image, name:name, genre:genre)
//            realmManager.saveObjects(objs:obj)
//        }
//    }
//}


struct UserItem {
  let id:Int = 0
  let image:String = ""
  let name:String = ""
  let genre:String = "Indefinido"
}

protocol UserInteractorInput {
  func fetchUser()
}

protocol UserInteractorOutput:class {
  func failedFetchUser()
}

final class UserInteractor {
  
  private var manager:UserManagerInput
  weak var output:UserInteractorOutput?
  
  init(manager:UserManagerInput) {
    self.manager = manager
  }
  
  static func mapper(entity:UserEntity) {
    
  }
}

extension UserInteractor:UserInteractorInput {
  
  func fetchUser() {
    
    self.manager.fetchUser { (arg) in
      
      if arg == nil {
        
        self.output?.failedFetchUser()
        
      }
    }
  }
}
