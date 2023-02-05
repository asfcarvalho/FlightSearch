//
//  AirportsDataSource.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 04/02/23.
//

import Foundation

public class AirportsDataSource {
    
    public static let shared = AirportsDataSource()
    private var token = CancelBag()
    private let url = "volumes?q=ios&maxResults=20&startIndex=%i"
    
    let URLDefault = APIStrings.baseUrl
        
    public func airportFetch(callBack: @escaping (Result<Airport, Error>) -> Void) {
        
        let apiRequest = APIRequest()
        let urlString = "https://mobile-testassets-dev.s3.eu-west-1.amazonaws.com/stations.json"
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
