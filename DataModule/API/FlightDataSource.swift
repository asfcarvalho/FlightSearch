//
//  FlightDataSource.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 05/02/23.
//

import Foundation

public class FlightDataSource {
    
    public static let shared = FlightDataSource()
    private var token = CancelBag()
    //en-IE/Availability?origin=DUB&destination=STN&dateout=2023-02-02&datein=&flexdaysbeforeout=3&flexdaysout=3&flexdaysbeforein=3&flexdaysin=3&adt=1&teen=0&chd=0&inf=0&roundtrip=false&ToUs=AGREED&Disc=0
    private let url = "en-IE/Availability?origin=%@&destination=%@&dateout=%@&datein=&flexdaysbeforeout=3&flexdaysout=3&flexdaysbeforein=3&flexdaysin=3&adt=%i&teen=%i&chd=%i&inf=0&roundtrip=false&ToUs=AGREED&Disc=0"
    
    let URLDefault = APIStrings.baseUrl
        
    public func flightFetch(_ search: Model.Search, callBack: @escaping (Result<Flight, Error>) -> Void) {
        
        let apiRequest = APIRequest()
        let urlString = String(format: "\(URLDefault)\(url)", search.origin, search.destination, search.dateout, search.adt, search.teen, search.chd)
        apiRequest.baseURL = URL(string: urlString)
        
        APICalling().fetch(apiRequest: apiRequest)
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    break
                case .failure(let error):
                    callBack(.failure(error))
                }
            }, receiveValue: { response in
                callBack(.success(response))
            }).store(in: token)
    }
}
