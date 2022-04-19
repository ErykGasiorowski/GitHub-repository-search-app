//
//  SearchRoutes.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 11/04/2022.
//

import Foundation
import UIKit

enum SearchRoutes: Route {
    case list
    case details(String)

    var screen: UIViewController {
        switch self {
        case .list:
            return buildSearchViewController()
        case .details(let repository):
            return buildSearchResponseViewController(repository)
        }
    }
    
    private func buildSearchViewController() -> UIViewController {
        let controller = SearchViewController()
        controller.viewModel = SearchViewModel(service: SearchServiceImpl.shared)
        return controller
    }
    
    private func buildSearchResponseViewController(_ repository: String) -> UIViewController {
        //let viewModel
        let controller = UIViewController()
        return controller
    }
}

