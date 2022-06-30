//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-29.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        // Dismiss the keyboard
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
