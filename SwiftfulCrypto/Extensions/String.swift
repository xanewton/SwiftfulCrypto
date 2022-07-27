//
//  String.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-07-26.
//

import Foundation

extension String {

    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
