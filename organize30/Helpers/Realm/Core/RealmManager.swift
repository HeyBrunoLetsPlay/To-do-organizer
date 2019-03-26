//
//  RealmManager.swift
//  Quadro Organizacional
//
//  Created by user on 03/10/2018.
//  Copyright © 2018 Bruno Raphael Castilho de Freitas. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    let realm = try? Realm()
    
    // delete table
//    func deleteDatabase() {
//        try! realm?.write({
//            realm?.deleteAll()
//        })
//    }
    
    // delete particular object
    func deleteObject(objs : Object) {
        try? realm!.write ({
            realm?.delete(objs)
        })
    }
    
    //Save array of objects to database
    func saveObjects(objs: Object) {
        try? realm!.write ({
            // If update = false, adds the object
            realm?.add(objs, update: false)
        })
    }
    
    // editing the object
    func editObjects(objs: Object) {
        try? realm!.write ({
            realm?.add(objs, update: true)
        })
    }
    
    //Returs an array as Results<object>?
    func getObjects(type: Object.Type) -> Results<Object>? {
      guard let objRealm = realm?.objects(type) else {
        return nil
      }
      return objRealm
    }
    
    func incrementID(type: Object.Type) -> Int {
        return (realm!.objects(type).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
