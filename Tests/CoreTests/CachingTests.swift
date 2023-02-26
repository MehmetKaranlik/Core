//
//  CachingTests.swift
//  
//
//  Created by mehmet karanlık on 26.02.2023.
//

import XCTest
@testable import Core

@available(iOS 13.0.0, *)
final class CachingTests: XCTestCase {
   var realmManager:  ExampleManager!

   override func setUpWithError() throws {
      realmManager = try ExampleManager() 
   }


   func testCreate() {
      let example = Example()
      example.name = "vb"
      realmManager.create(model: example) { result in
         XCTAssert(result,"Result is success")
      }
   }

   func testRead() {
      let example = Example()
      example.name = "vb"
      realmManager.create(model: example) { result in
         XCTAssert(result,"Result is success")
      }
      realmManager.read(completion: { example in
      
         XCTAssert(example != nil,"Example is not nil")
      })
   }

   func testUpdate() {
      let example = Example()
      example.name = "mk"
      realmManager.update(model: example) { result in
         XCTAssert(result)
      }

      realmManager.read { example in
         XCTAssert(example?.name == "mk", "Test is sucessfull")
      }
   }


   func testDelete() {
      let example = Example()
      realmManager.delete(model: example) { [weak self] result in
         XCTAssert(result)
         self?.realmManager.read { example in
            XCTAssert(example == nil)
         }
      }


   }
}
