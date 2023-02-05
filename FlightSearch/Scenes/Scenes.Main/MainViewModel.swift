//
//  MainViewModelViewModel.swift
//  FlightSearch
//
//  Created by Anderson F Carvalho on 31/01/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import BaseUI
import DataModule

class MainViewModel: ObservableObject {
    @Published var stations: [Model.Station]?
    @Published var origin: String = ""
    @Published var destination: String = ""
    @Published var dateout: Date = Date()
    @Published var adt: Int = 1
    @Published var teen: Int = 0
    @Published var chd: Int = 0
    
    var router: MainRouter?
    
    init(_ stations: [Model.Station]? = nil) {
        self.stations = stations
    }
}

extension MainViewModel {
    public func send(action: ViewModel.Main.ViewInput.Action) {
        switch action {
        case .dismiss:
            router?.perform(action: .dismiss)
            
        case .onAppear:
            fetchStations()
            
        case .adultPlus:
            if adt < 6 {
                adt += 1
            }
        case .adultMinus:
            if adt > 1 {
                adt -= 1
            }
        case .teenPlus:
            if teen < 6 {
                teen += 1
            }
        case .teenMinus:
            if teen > 0 {
                teen -= 1
            }
        case .childrenPlus:
            if chd < 6 {
                chd += 1
            }
        case .childrenMinus:
            if chd > 0 {
                chd -= 1
            }
            
        case .searchAction:
            router?.perform(action: .showResult(mapSearch()))
        }
    }
    
    private func mapSearch() -> Model.Search {
        let stationDefault = stations?.first?.code ?? ""
        let origin = self.origin.isEmpty ? stationDefault : self.origin
        let destination = self.destination.isEmpty ? stationDefault : self.destination
        
        let search = Model.Search(origin: origin,
                                  destination: destination,
                                  dateout: dateout.formatDate(),
                                  adt: adt,
                                  teen: teen,
                                  chd: chd)
        
        return search
    }
    
    private func fetchStations() {
        AirportsDataSource.shared.airportFetch { result in
            switch result {
            case .success(let airport):
                self.stations = airport.stations.asStationArray()
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

public extension ViewModel {
    enum Main {
        public enum ViewOutput {
            public enum Action: Hashable {
                case dismiss
                case adultPlus
                case adultMinus
                case teenPlus
                case teenMinus
                case childrenPlus
                case childrenMinus
                case searchAction
            }
        }
        
        public enum ViewInput: Hashable {
            public enum Action: Hashable {
                case dismiss
                case onAppear
                case adultPlus
                case adultMinus
                case teenPlus
                case teenMinus
                case childrenPlus
                case childrenMinus
                case searchAction
            }
        }
    }
}
