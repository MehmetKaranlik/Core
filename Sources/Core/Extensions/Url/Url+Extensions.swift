//
//  File.swift
//  
//
//  Created by mehmet karanlık on 3.03.2023.
//

import Foundation
public extension URL {
      /// SwifterSwift: URL with appending query parameters.
      ///
      ///      let url = URL(string: "https://google.com")!
      ///      let param = ["q": "Swifter Swift"]
      ///      url.appendingQueryParameters(params) -> "https://google.com?q=Swifter%20Swift"
      ///
      /// - Parameter parameters: parameters dictionary.
      /// - Returns: URL with appending given query parameters.
   func appendingQueryParameters(_ parameters: [String: String]) -> URL {
      var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
      urlComponents.queryItems = (urlComponents.queryItems ?? []) + parameters
         .map { URLQueryItem(name: $0, value: $1) }
      return urlComponents.url!
   }

      ///Append query parameters to URL.
      ///
      ///      var url = URL(string: "https://google.com")!
      ///      let param = ["q": "Swifter Swift"]
      ///      url.appendQueryParameters(params)
      ///      print(url) // prints "https://google.com?q=Swifter%20Swift"
      ///
      /// - Parameter parameters: parameters dictionary.
   mutating func appendQueryParameters(_ parameters: [String: String]) {
      self = appendingQueryParameters(parameters)
   }

      ///Get value of a query key.
      ///
      ///    var url = URL(string: "https://google.com?code=12345")!
      ///    queryValue(for: "code") -> "12345"
      ///
      /// - Parameter key: The key of a query value.
   func queryValue(for key: String) -> String? {
      return URLComponents(string: absoluteString)?
         .queryItems?
         .first(where: { $0.name == key })?
         .value
   }

      /// Returns a new URL by removing all the path components.
      ///
      ///     let url = URL(string: "https://domain.com/path/other")!
      ///     print(url.deletingAllPathComponents()) // prints "https://domain.com/"
      ///
      /// - Returns: URL with all path components removed.
   func deletingAllPathComponents() -> URL {
      guard !pathComponents.isEmpty else { return self }

      var url: URL = self
      for _ in 0..<pathComponents.count - 1 {
         url.deleteLastPathComponent()
      }
      return url
   }

      ///Remove all the path components from the URL.
      ///
      ///        var url = URL(string: "https://domain.com/path/other")!
      ///        url.deleteAllPathComponents()
      ///        print(url) // prints "https://domain.com/"
   mutating func deleteAllPathComponents() {
      guard !pathComponents.isEmpty else { return }

      for _ in 0..<pathComponents.count - 1 {
         deleteLastPathComponent()
      }
   }

      /// Retursn url without scheme
      ///
      ///        let url = URL(string: "https://domain.com")!
      ///        print(url.droppedScheme()) // prints "domain.com"
   func droppedScheme() -> URL? {
      if let scheme = scheme {
         let droppedScheme = String(absoluteString.dropFirst(scheme.count + 3))
         return URL(string: droppedScheme)
      }

      guard host != nil else { return self }

      let droppedScheme = String(absoluteString.dropFirst(2))
      return URL(string: droppedScheme)
   }
}
