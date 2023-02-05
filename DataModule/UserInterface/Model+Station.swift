//
//  Model+Station.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 04/02/23.
//

import Foundation

public extension Model {
    struct Station: Hashable {
        public let code, name: String
        
        public init(code: String, name: String) {
            self.code = code
            self.name = name
        }
    }
}
