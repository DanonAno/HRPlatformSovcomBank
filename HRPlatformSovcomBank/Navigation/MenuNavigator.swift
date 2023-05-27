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
}

final class MenuNavigator: MenuNavigatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toProfile() {
        let vc = ProfileViewController()
        
    }
    
}
