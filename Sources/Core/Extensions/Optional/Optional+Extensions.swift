//
//  File.swift
//  
//
//  Created by mehmet karanlık on 1.03.2023.
//

import Foundation

extension Optional where Wrapped == String  {

   var isNilOrEmpty : Bool {
      return self?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty != false
   }

   var isNotNilAndNotEmpty : Bool {
      return self?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false
   }
}
