//
//  Flight+Mapper.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation
import Common

internal extension FlightElement {
    func asFlight() -> Model.Flight {
        let date = time.first?.formatDate()?.formatDate() ?? ""
        let regularFare = (regularFare.fares.first?.publishedFare ?? 0.0).currency() ?? ""
                
        return Model.Flight(date: date,
                            flightNumber: flightNumber,
                            regularFare: regularFare)
    }
}

public extension Sequence where Element == FlightElement {
    
    func asFlightArray() -> [Model.Flight] {
        self.map { $0.asFlight() }
    }
    
}

internal extension Trip {
    func asTrip() -> Model.Trip {
        Model.Trip(dates: dates.asDateArray())
    }
}

public extension Sequence where Element == Trip {
    
    func asTripArray() -> [Model.Trip] {
        self.map { $0.asTrip() }
    }
    
}

internal extension DateElement  {
    func asDate() -> Model.Date {
        Model.Date(flights: flights.asFlightArray())
    }
}

public extension Sequence where Element == DateElement {
    
    func asDateArray() -> [Model.Date] {
        self.map { $0.asDate() }
    }
    
}
