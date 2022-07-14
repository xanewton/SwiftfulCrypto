//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-07-13.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
