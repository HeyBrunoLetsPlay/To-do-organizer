//
//  WelcomeHeaderDisplayItem.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 17/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

enum StatusWelcomeHeaderDisplayItem {
    case day
    case night
}

class WelcomeHeaderDisplayItem {
    let skyImageString:String
    let status:StatusWelcomeHeaderDisplayItem
    
    init(_ status:StatusWelcomeHeaderDisplayItem) {
        self.skyImageString = status == .day ? "ceu_dia" : "ceu_noite"
        self.status = status
    }
}
