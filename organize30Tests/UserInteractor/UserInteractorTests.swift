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
  
  
  func testFetchUser() {
    
    // 1. GIVEN
    XCTAssertNil(self.item, "Está nulo antes de iniciar")
    
    // 2. WHEN
    let interactor = UserInteractorMockBuilder.make(self, false)
    interactor.fetchUser()
    
    // 3. THEN
    XCTAssertNotNil(self.item, "Item foi capturado com sucesso")
  }
  
  func testFailedFetchUser() {
    
    // 1. GIVEN
    XCTAssertFalse(self.isError, "Está nulo antes de iniciar")
    
    // 2. WHEN
    let interactor = UserInteractorMockBuilder.make(self, true)
    interactor.fetchUser()
    
    // 3. THEN
    XCTAssertTrue(self.isError, "Erro chamado")
    
  }
  
  func testSaveAndFetchUser() {
    
    //1. GIVEN
    XCTAssertNil(self.item, "Está nulo antes de iniciar")
    
    //2. WHEN
    let interactor = UserInteractorBuilder.make(output: self)
    interactor.saveUserWith(image: "", name: "", genre: "")
    interactor.fetchUser()
    
    //3. THEN
    XCTAssertNotNil(self.item, "Item foi capturado com sucesso")
  }
  
}


extension UserInteractorTests : UserInteractorOutput {
  
  func fetched(user: UserItem) {
    self.item = user
  }
  
  func failedFetchUser() {
    self.isError = true
  }
}
