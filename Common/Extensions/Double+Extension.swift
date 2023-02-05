//
//  Double+Extension.swift
//  Common
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public extension Double {
    func currency() -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = "EUR"
        
        return currencyFormatter.string(from: NSNumber(value: self))
    }
}
