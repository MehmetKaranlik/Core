//
//  File.swift
//  
//
//  Created by mehmet karanlık on 6.03.2023.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct OptionalEnvironmentModifier<T: ObservableObject> : ViewModifier {
   let environmentObject : T?
   public func body(content: Content) -> some View {
      if let environmentObject {
         content
            .environmentObject(environmentObject)
      }else {
         content
      }

   }
}
