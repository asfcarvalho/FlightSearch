//
//  FlightElement.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public struct FlightElement: Codable {
    let regularFare: RegularFare
    let flightNumber: String
    let time: [String]
}
