//
//  View+Extensions.swift
//  UIKit+SwiftUI+Architecture
//
//  Created by mehmet karanlık on 20.02.2023.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 13.0, *)
public extension View {
   func toHostingController() -> UIHostingController<Self> {
      return UIHostingController<Self>(rootView: self)
   }

      var keyboardPublisher: AnyPublisher<Bool, Never> {
         Publishers
            .Merge(
               NotificationCenter
                  .default
                  .publisher(for: UIResponder.keyboardWillShowNotification)
                  .map { _ in true },
               NotificationCenter
                  .default
                  .publisher(for: UIResponder.keyboardWillHideNotification)
                  .map { _ in false })
            .debounce(for: .seconds(0.1), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
   }
}
