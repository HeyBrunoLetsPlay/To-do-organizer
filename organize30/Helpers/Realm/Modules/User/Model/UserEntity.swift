
//
//  User.swift
//  Quadro Organizacional
//
//  Created by Bruno Raphael Castilho de Freitas on 06/09/2018.
//  Copyright © 2018 Bruno Raphael Castilho de Freitas. All rights reserved.
//

import Foundation
import RealmSwift

class UserEntity:Object {
  
  @objc private(set) dynamic var id = 0
  @objc private(set) dynamic var image = ""
  @objc private(set) dynamic var name = ""
  @objc private(set) dynamic var genre = "Indefinido"
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  convenience init(id:Int, image:String, name:String, genre:String) {
    self.init()
    self.id = id
    self.image = image
    self.name = name
    self.genre = genre
  }
}
