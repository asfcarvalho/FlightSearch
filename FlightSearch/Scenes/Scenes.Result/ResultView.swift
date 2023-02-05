//
//  ResultViewView.swift
//  FlightSearch
//
//  Created by Anderson F Carvalho on 05/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Common
import BaseUI
import Components
import DataModule

struct ResultView: View {
    
    @ObservedObject var input: ResultViewModel
    public var output = MyObservableObject<ViewModel.Result.ViewOutput.Action>()
    
    private var token = CancelBag()
    
    init(input: ResultViewModel) {
        self.input = input
    }
    
    var body: some View {
        NavigationView {
            VStack {
                navigationBar
                Divider()
                ScrollView {
                    if input.fetchStatus == .isFetching {
                        ProgressView()
                    } else
                    if let flights = input.flights {
                        ForEach(flights, id: \.self) { flight in
                            VStack {
                                HStack {
                                    Text("Date:")
                                    Spacer()
                                    Text(flight.date)
                                }
                                HStack {
                                    Text("Flight number:")
                                    Spacer()
                                    Text(flight.flightNumber)
                                }
                                HStack {
                                    Text("Regular Fare:")
                                    Spacer()
                                    Text(flight.regularFare)
                                }
                            }.padding()
                            Divider()
                        }
                    } else {
                        Text("No flight found")
                    }
                }
            }.navigationBarHidden(true)
        }.onTapGesture {
            hideKeyboard()
        }
    }
    
    private var navigationBar: some View {
        let navigation = MyNavigationBarView(input: .init(title: "Results"))
        
        navigation.output.value.sink { action in
            switch action {
            case .buttonLeftTapped:
                output.value.send(.dismiss)
            default:
                break
            }
        }.store(in: token)
        
        return navigation
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(input: .init(Model.Search(origin: "", destination: "", dateout: "", adt: 1, teen: 0, chd: 0)))
    }
}
