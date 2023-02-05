//
//  Flight.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public struct Flight: Codable {
    let termsOfUse: String
    let currency: String
    let currPrecision: Int
    let routeGroup, tripType, upgradeType: String
    public let trips: [Trip]
    let serverTimeUTC: String
}
