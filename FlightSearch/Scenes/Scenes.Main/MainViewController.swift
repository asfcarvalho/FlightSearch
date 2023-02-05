//
//  MainViewControllerViewController.swift
//  FlightSearch
//
//  Created by Anderson F Carvalho on 31/01/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
import DataModule

class MainViewController: UIHostingController<MainView> {
    
    private var token = CancelBag()
    private var viewModel: MainViewModel?
    
    override init(rootView: MainView) {
        super.init(rootView: rootView)
        
        viewModel = rootView.input
        configureComunication()
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.viewModel?.send(action: .onAppear)
    }
    
    func configureComunication() {
        rootView.output.value.sink { [weak self] action in
            guard let self = self else { return }
            switch action {
            case .dismiss:
                self.viewModel?.send(action: .dismiss)
            case .adultPlus:
                self.viewModel?.send(action: .adultPlus)
            case .adultMinus:
                self.viewModel?.send(action: .adultMinus)
            case .teenPlus:
                self.viewModel?.send(action: .teenPlus)
            case .teenMinus:
                self.viewModel?.send(action: .teenMinus)
            case .childrenPlus:
                self.viewModel?.send(action: .childrenPlus)
            case .childrenMinus:
                self.viewModel?.send(action: .childrenMinus)
            case .searchAction:
                self.viewModel?.send(action: .searchAction)
            }
        }.store(in: token)
    }
}
