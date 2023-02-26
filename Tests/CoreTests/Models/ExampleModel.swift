//
//  File.swift
//
//
//  Created by mehmet karanlık on 26.02.2023.
//

import Foundation
import RealmSwift
@testable import Core

class Example: Object, RealmObject {
   @Persisted(primaryKey: true) var primaryKey: String = "11"
   @Persisted var name = ""


   override class func primaryKey() -> String? {
      "primaryKey"
   }
}

@available(iOS 13.0, *)
struct ExampleManager: IRealmManager {

   typealias T = Example

   var database: Realm

   func create(model: Example, completion: @escaping CompletionHandler) {
      do {
         try database.write({
            database.add(model)
            completion(true)
         })
      }catch  {
         completion(false)
      }

     
   }

   func read(completion: @escaping CompletionWithModel) {
      let model = database.objects(T.self).first
      completion(model)
   }

   func update(model: Example, completion: @escaping CompletionHandler) {
      do {
         try database.write {
            database.add(model, update: .modified)
            completion(true)
         }
      }catch {
         completion(false)
      }
   }

   func delete(model: Example, completion: @escaping CompletionHandler) {
      do {
        try database.write {
           let item = database.objects(T.self)
            database.delete(item)
            completion(true)
         }
      }catch  {
         completion(false)
      }
   }


   init() throws {
      do {
         self.database = try Realm(configuration: .init(inMemoryIdentifier: "Example"), queue: .main)
      } catch let e as NSError {
         throw e
      }
   }
}
