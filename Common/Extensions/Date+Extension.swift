//
//  String+Extension.swift
//  Common
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public extension Date {
    func formatDate() -> String {
        let formatDate = DateFormatter()
        formatDate.dateFormat = "yyyy-MM-dd"
        
        return formatDate.string(from: self)
    }
}
