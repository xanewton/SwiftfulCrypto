//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-23.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
