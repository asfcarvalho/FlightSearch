//
//  String+Extension.swift
//  Common
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public extension String {
    func formatDate() -> Date? {
        let formatDate = DateFormatter()
        formatDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss" //2023-02-03T00:00:00.000
        
        return formatDate.date(from: self)
    }
}
