//
//  ResultViewModelViewModel.swift
//  FlightSearch
//
//  Created by Anderson F Carvalho on 05/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import BaseUI
import DataModule

class ResultViewModel: ObservableObject {
    @Published var search: Model.Search?
    @Published var flights: [Model.Flight]?
    @Published var fetchStatus: FetchStatus = .isFetching
    
    enum FetchStatus {
        case isFetching
        case fetched
    }
    
    var router: ResultRouter?
    
    init(_ search: Model.Search) {
        self.search = search
    }
    
    public func send(action: ViewModel.Result.ViewInput.Action) {
        switch action {
        case .dismiss:
            router?.perform(action: .dismiss)
        case .fetchFligths:
            fetchFlights()
        }
    }
    
    private func fetchFlights() {
        guard let search = search else { return }
        
        FlightDataSource.shared.flightFetch(search) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.fetchStatus = .fetched
                let trips = success.trips.asTripArray()
                
                self.flights = trips.first?.dates.flatMap({ $0.flights })
    
            case .failure(let failure):
                debugPrint(failure)
                self.fetchStatus = .fetched
            }
        }
    }
}

public extension ViewModel {
    enum Result {
        public enum ViewOutput {
            public enum Action: Hashable {
                case dismiss
            }
        }
        
        public enum ViewInput: Hashable {
            public enum Action: Hashable {
                case dismiss
                case fetchFligths
            }
        }
    }
}
