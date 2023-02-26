//
//  RegexConstants.swift
//  UIKit+SwiftUI+Architecture
//
//  Created by mehmet karanlık on 25.02.2023.
//

import Foundation

public struct RegexConstants {
   let youtube = try? NSRegularExpression(pattern: "^(?:https?:\\/\\/)?(?:www\\.)?(?:youtube\\.com\\/watch\\?v=|youtu\\.be\\/)([\\w-]{11})(?:\\S+)?$", options: .caseInsensitive)

   let emailRegex =  try? NSRegularExpression(pattern: "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", options: .caseInsensitive)

   let passwordRegex = try? NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$", options: [])

}



