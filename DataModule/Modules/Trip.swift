//
//  Trip.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public struct Trip: Codable {
    let origin, originName, destination, destinationName: String
    let routeGroup, tripType, upgradeType: String
    public let dates: [DateElement]
}
