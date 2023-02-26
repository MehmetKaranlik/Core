//
//  File.swift
//  
//
//  Created by mehmet karanlık on 26.02.2023.
//

import Foundation
import RealmSwift

public protocol RealmObject where Self : Object {
   var primaryKey : String { get }
}
