//
//  File.swift
//  
//
//  Created by mehmet karanlık on 26.02.2023.
//

import Foundation
import RealmSwift

@available(iOS 13.0, *)
public protocol IRealmManager {
   typealias CompletionHandler = (Bool) -> ()
   typealias CompletionWithModel = (T?) -> ()
   associatedtype T : Object,RealmObject
   var database : Realm { get set }
   func create(model : T, completion : @escaping CompletionHandler)
   func read(completion: @escaping CompletionWithModel)
   func update(model : T, completion : @escaping CompletionHandler)
   func delete(model :T, completion : @escaping CompletionHandler)
}


