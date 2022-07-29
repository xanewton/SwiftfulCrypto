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
    static let launch = LaunchTheme()
}

// This is adaptable because: we can add more colors to the theme or new themes, we can use this colors in the app code.
struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
