//
//  LoginNavigationProtocol.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 26.05.2023.
//

import UIKit

protocol LoginNavigatorProtocol {
    func toVacancy()
}

final class LoginNavigator: LoginNavigatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func toVacancy() {
        let vc = VacancyViewController()
        vc.navigationItem.title = "Вакансии"
        let titleLabel = UILabel()
        titleLabel.text = "Вакансии"
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        titleLabel.sizeToFit()
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
    }
}
