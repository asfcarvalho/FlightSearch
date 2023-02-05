//
//  ResultRouterRouter.swift
//  FlightSearch
//
//  Created by Anderson F Carvalho on 05/02/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import BaseUI
import DataModule

class ResultRouter{
    
    private(set) weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
        
    class func build(_ search: Model.Search) -> UIHostingController<ResultView> {
        let viewModel = ResultViewModel(search)
        let rootView = ResultView(input: viewModel)
        let viewController = ResultViewController(rootView: rootView)
        viewModel.router = ResultRouter(viewController: viewController)
        
        return viewController
    }
    
    func perform(action: Router.ResultRouter.ViewOutput.Acion) {
        switch action {
        case .sample:
            break
        case .dismiss:
            viewController?.dismiss(animated: true)
        }
    }
}

public extension Router {
    enum ResultRouter {
        public enum ViewOutput {
            public enum Acion: Hashable {
                case sample
                case dismiss
            }
        }
    }
}
