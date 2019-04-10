//
//  UserInteractorMockBuilder.swift
//  organize30Tests
//
//  Created by Bruno Raphael Castilho de Freitas on 09/04/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation
@testable import organize30

final class UserInteractorMockBuilder {
  
  static func make(_ output:UserInteractorOutput, _ failed:Bool) -> UserInteractorInput {
    
    let manager = UserManagerMock.init(failed:failed)
    let interactor = UserInteractor.init(manager: manager)
    interactor.output = output
    
    return interactor
  }
}
