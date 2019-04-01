//
//  UserInteractorTests.swift
//  organize30Tests
//
//  Created by Bruno Raphael Castilho de Freitas on 29/03/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import XCTest
@testable import organize30

class UserInteractorTests: XCTestCase {
  
  var requestExpectation:XCTestExpectation!
  var item:UserItem?
  var isError:Bool = false
  
  override func setUp() {
    super.setUp()
    self.requestExpectation = XCTestExpectation.init(description:"Async Request")
  }
  
  override func tearDown() {
    super.tearDown()
    self.requestExpectation = nil
    self.item = nil
  }
  
  func testErrorFetchUser() {
    
    //1. GIVEN
    let interactor = UserInteractorBuilder.make()
    interactor.output = self
    //2. WHEN
    
    
    //3. THEN
    
  }
}


extension UserInteractorTests : UserInteractorOutput {
  
  func failedFetchUser() {
    
  }
}
