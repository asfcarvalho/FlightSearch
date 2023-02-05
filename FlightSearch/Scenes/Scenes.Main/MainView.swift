//
//  MainViewView.swift
//  FlightSearch
//
//  Created by Anderson F Carvalho on 31/01/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Common
import BaseUI
import Components
import DataModule

struct MainView: View {
    
    @ObservedObject var input: MainViewModel
    public var output = MyObservableObject<ViewModel.Main.ViewOutput.Action>()
    
    private var token = CancelBag()
        
    init(input: MainViewModel) {
        self.input = input
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                originStation
                destinationStation
                departureDate
                adult
                teen
                children
                buttonSearch
                    .frame(height: 40, alignment: .center)
                    .padding(.top)
                Spacer()
            }.padding()
        }
    }
    
    private var originStation: some View {
        ZStack {
            if let stations = input.stations {
                Picker("Origin station", selection: $input.origin) {
                    ForEach(stations, id: \.self) { station in
                        Text("\(station.name) (\(station.code))").tag(station.code)
                    }
                }.pickerStyle(.navigationLink)
            }
        }
    }
    
    private var destinationStation: some View {
        ZStack {
            if let stations = input.stations {
                Picker("Destination station", selection: $input.destination) {
                    ForEach(stations, id: \.self) { station in
                        Text("\(station.name) (\(station.code))").tag(station.code)
                    }
                }.pickerStyle(.navigationLink)
            }
        }
    }
    
    private var departureDate: some View {
        DatePicker(
            "Departure date",
            selection: $input.dateout,
            displayedComponents: [.date]
        )
    }
    
    private var adult: some View {
        HStack(spacing: 2) {
            Text("Adults (\(input.adt))")
                .padding(.trailing)
            Spacer()
            Button {
                output.value.send(.adultMinus)
            } label: {
                Text("-")
                    .frame(width: 40)
                    .background(.gray)
                    .foregroundColor(.white)
            }

            Button {
                output.value.send(.adultPlus)
            } label: {
                Text("+")
                    .frame(width: 40)
                    .background(.gray)
                    .foregroundColor(.white)
            }
        }
    }
    
    private var teen: some View {
        HStack(spacing: 2) {
            Text("Teen (\(input.teen))")
                .padding(.trailing)
            Spacer()
            Button {
                output.value.send(.teenMinus)
            } label: {
                Text("-")
                    .frame(width: 40)
                    .background(.gray)
                    .foregroundColor(.white)
            }

            Button {
                output.value.send(.teenPlus)
            } label: {
                Text("+")
                    .frame(width: 40)
                    .background(.gray)
                    .foregroundColor(.white)
            }
        }
    }
    
    private var children: some View {
        HStack(spacing: 2) {
            Text("Children (\(input.chd))")
                .padding(.trailing)
            Spacer()
            Button {
                output.value.send(.childrenMinus)
            } label: {
                Text("-")
                    .frame(width: 40)
                    .background(.gray)
                    .foregroundColor(.white)
            }

            Button {
                output.value.send(.childrenPlus)
            } label: {
                Text("+")
                    .frame(width: 40)
                    .background(.gray)
                    .foregroundColor(.white)
            }
        }
    }
    
    private var buttonSearch: some View {
        Button {
            output.value.send(.searchAction)
        } label: {
            ZStack {
                Rectangle()
                    .stroke(Color.black)
                Text("Search")
                    .font(.title2)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(input: .init())
    }
}

struct TVShow: Identifiable {
    var id: String { name }
    let name: String
}
