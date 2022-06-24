//
//  Color.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-23.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
}

// This is adaptable because: we can add more colors to the theme or new themes, we can use this colors in the app code.
struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
