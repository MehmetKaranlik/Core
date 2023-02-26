//
//  File.swift
//  
//
//  Created by mehmet karanlık on 27.02.2023.
//

import Foundation


extension NSRegularExpression {
   func isValid(_ of : String) -> Bool {
      if self.firstMatch(in: of, range: NSRange(location: 0, length: of.utf16.count)) != nil {
         return true
      }
      return false
   }
}
