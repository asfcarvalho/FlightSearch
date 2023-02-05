//
//  Station+Mapper.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

internal extension Station {
    func asStation() -> Model.Station {
        Model.Station(code: code, name: name)
    }
}

public extension Sequence where Element == Station {
    
    func asStationArray() -> [Model.Station] {
        self.map { $0.asStation() }
    }
    
}
