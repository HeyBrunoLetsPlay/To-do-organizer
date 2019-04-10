//
//  UserManager.swift
//  Quadro Organizacional
//
//  Created by user on 05/10/2018.
//  Copyright © 2018 Bruno Raphael Castilho de Freitas. All rights reserved.
//
import Foundation
import RealmSwift

struct UserItem {
  let id:Int
  let image:String
  let name:String
  let genre:String
  
  init(user:UserEntity) {
    self.id = user.id
    self.image = user.image
    self.name = user.name
    self.genre = user.genre
  }
}

protocol UserInteractorInput {
  func fetchUser()
  func saveUserWith(image:String?, name:String?, genre:String?)
}

protocol UserInteractorOutput:class {
  func failedFetchUser()
  func fetched(user:UserItem)
}

final class UserInteractor {
  
  private var manager:UserManagerInput
  weak var output:UserInteractorOutput?
  
  init(manager:UserManagerInput) {
    self.manager = manager
  }
  
  private func mapper(entity:UserEntity)-> UserItem {
    
    return UserItem.init(user: entity)
  }
}

extension UserInteractor:UserInteractorInput {
  
  func saveUserWith(image:String?, name:String?, genre:String?) {
    
    self.manager.saveUserWith(image: image ?? "", name: name ?? "", genre: genre ?? "")
    
  }
  
  
  func fetchUser() {
    
    self.manager.fetchUser { (arg) in
      
      if arg == nil {
        
        self.output?.failedFetchUser()
        
      } else {
        
        self.output?.fetched(user:self.mapper(entity:arg!))
        
      }
    }
  }
}
