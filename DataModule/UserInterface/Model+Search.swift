//
//  Model+Search.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public extension Model {
    struct Search: Hashable {
        public let origin: String
        public let destination: String
        public let dateout: String
        public let adt: Int
        public let teen: Int
        public let chd: Int
        
        public init(origin: String, destination: String, dateout: String, adt: Int, teen: Int, chd: Int) {
            self.origin = origin
            self.destination = destination
            self.dateout = dateout
            self.adt = adt
            self.teen = teen
            self.chd = chd
        }
    }
}
