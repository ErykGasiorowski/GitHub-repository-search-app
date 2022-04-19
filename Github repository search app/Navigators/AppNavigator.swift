//
//  AppNavigator.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 11/04/2022.
//

import Foundation
import UIKit

class AppNavigator: BaseNavigator {
    static let shared = AppNavigator()
    
    init() {
        let route: Route = SearchRoutes.list
        super.init(with: route)
    }
    
    required init(with route: Route) {
        super.init(with: route)
    }
    
    var settingsParentVC: UIViewController?
    
    func popSettings() {
        guard let settingsParentVC = settingsParentVC else {
            popEmbedded()
            return
        }
        popEmbedded(to: settingsParentVC, animated: false)
    }
}
