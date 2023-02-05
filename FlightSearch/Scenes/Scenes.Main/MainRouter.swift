//
//  MainRouterRouter.swift
//  FlightSearch
//
//  Created by Anderson F Carvalho on 31/01/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import BaseUI
import DataModule

class MainRouter{
    
    private(set) weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
        
    class func build() -> UIHostingController<MainView> {
        let viewModel = MainViewModel()
        let rootView = MainView(input: viewModel)
        let viewController = MainViewController(rootView: rootView)
        viewModel.router = MainRouter(viewController: viewController)
        
        return viewController
    }
    
    func perform(action: Router.MainRouter.ViewOutput.Acion) {
        switch action {
        case .showResult(let search):
            let vc = ResultRouter.build(search)
            vc.modalPresentationStyle = .overFullScreen
            viewController?.present(vc, animated: true)
        case .dismiss:
            viewController?.dismiss(animated: true)
        }
    }
}

public extension Router {
    enum MainRouter {
        public enum ViewOutput {
            public enum Acion: Hashable {
                case showResult(_ search: Model.Search)
                case dismiss
            }
        }
    }
}
