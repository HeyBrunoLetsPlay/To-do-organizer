//
//  Results+Helper.swift
//  Quadro Organizacional
//
//  Created by user on 24/09/2018.
//  Copyright © 2018 Bruno Raphael Castilho de Freitas. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}
