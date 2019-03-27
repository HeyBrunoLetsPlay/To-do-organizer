//
//  UserManager.swift
//  Quadro Organizacional
//
//  Created by user on 05/10/2018.
//  Copyright © 2018 Bruno Raphael Castilho de Freitas. All rights reserved.
//
import Foundation
import RealmSwift

class UserManager {
    func save(image:String, name:String, genre:String){
        let realmManager = RealmManager()
        if let objUser = realmManager.getObjects(type:User.self)?.first as? User {
            let editUser = User.init(id:objUser.id, image:image, name:name, genre:genre)
            realmManager.editObjects(objs:editUser)
        }else {
            let id = realmManager.incrementID(type:User.self)
            let obj = User.init(id:id, image:image, name:name, genre:genre)
            realmManager.saveObjects(objs:obj)
        }
    }
}
