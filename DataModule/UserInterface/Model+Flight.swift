//
//  Model+Flight.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public extension Model {
    struct Flight: Hashable {
        public let date: String
        public let flightNumber: String
        public let regularFare: String
        
        public init(date: String, flightNumber: String, regularFare: String) {
            self.date = date
            self.flightNumber = flightNumber
            self.regularFare = regularFare
        }
    }
}

public extension Model {
    struct Trip: Hashable {
        public let dates: [Model.Date]
        
        public init(dates: [Model.Date]) {
            self.dates = dates
        }
    }
}

public extension Model {
    struct Date: Hashable {
        public let flights: [Model.Flight]
        
        public init(flights: [Model.Flight]) {
            self.flights = flights
        }
    }
}
