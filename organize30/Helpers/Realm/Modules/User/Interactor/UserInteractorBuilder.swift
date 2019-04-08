//
//  UserInteractorBuilder.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 31/03/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

final class UserInteractorBuilder {
  
  static func make(output:UserInteractorOutput) -> UserInteractor {
    
    let interactor = UserInteractor.init(manager: UserManager())
    
    interactor.output = output
    
    return interactor
  }
  
}
