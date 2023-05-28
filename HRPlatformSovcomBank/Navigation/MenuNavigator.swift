//
//  MenuNavigator.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit
import RxSwift

protocol MenuNavigatorProtocol {
    func toProfile()
    func toSettings()
}


final class MenuNavigator: MenuNavigatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toProfile() {
        let vc = ProfileViewController()
        guard (vc.jobInfoLabel.text != nil)  else {
            let vc = ProfileFillViewController()
            let viewModel = ProfileFillViewModel()
            vc.viewModel = viewModel
            navigationController.pushViewController(vc, animated: true)
            return
        }
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toSettings() {
        
    }
    
}
