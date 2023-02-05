//
//  DateElement.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public struct DateElement: Codable {
    let dateOut: String
    public let flights: [FlightElement]
}
