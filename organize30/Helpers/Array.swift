//
//  Array.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation


extension Array {
    
    func getObject(at index: Int) -> AnyObject? {
        return self.indices.contains(index) ? self[index] as AnyObject : nil
    }
}
