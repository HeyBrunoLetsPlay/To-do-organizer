//
//  UserInteractorTests.swift
//  organize30Tests
//
//  Created by Bruno Raphael Castilho de Freitas on 29/03/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import XCTest

class UserInteractorTests: XCTestCase {
  
  var requestExpectation:XCTestExpectation!
  
  
  override func setUp() {
    super.setUp()
    self.requestExpectation = XCTestExpectation.init(description:"Async Request")
  }
  
  override func tearDown() {
    super.tearDown()
    self.requestExpectation = nil
  }
  
  func testExample() {
    
  }
  
}
