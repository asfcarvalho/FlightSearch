//
//  APIRequest.swift
//  DataModule
//
//  Created by Anderson F Carvalho on 04/02/23.
//

import Foundation

class APIRequest {
    var baseURL: URL!
    var method = "GET"
    var parameters = [String: String]()
    
    func request(with baseURL: URL) -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method
        request.allHTTPHeaderFields = ["Content-type" : "application/json", "client" : "ios"]
        return request
    }
}
