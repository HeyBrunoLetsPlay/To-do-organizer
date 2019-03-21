//
//  WelcomeHeaderInteractor.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 22/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation



protocol WelcomeHeaderInteractorInput {
    func getTime()
}

protocol  WelcomeHeaderInteractorOutput{
    func fetched(_ time:StatusWelcomeHeaderDisplayItem)
}

class WelcomeHeaderInteractor:WelcomeHeaderInteractorInput {
    
    var output:WelcomeHeaderInteractorOutput?
   
    func getTime() {

        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("HH.mm")
        let currentTime = dateFormatter.string(from:Date.init())
        
        if let current = Float(currentTime){
            
            if current >= 18.00 {
              self.output?.fetched(.night)
            }else {
                self.output?.fetched(.day)
            }
        }
    }
    
}

