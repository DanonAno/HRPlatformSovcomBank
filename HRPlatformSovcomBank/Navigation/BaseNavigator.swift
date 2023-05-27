//
//  BaseNavigator.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit


protocol BaseNavigatorProtocol {
    func toStartVc()
    func toVacancy()
}

final class BaseNavigator: BaseNavigatorProtocol {
    private let navigationController: UINavigationController
    private let services: NetworkProvider
    
    init(services: NetworkProvider,
         navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
    
    func toStartVc() {
        let vc = ViewController()
        let viewModel = LoginViewModel(navigator: self)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toVacancy() {
        let vc = VacancyViewController()
        let titleLabel = UILabel()
        titleLabel.text = "Вакансии"
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        titleLabel.sizeToFit()
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        print("#BROHA")
        navigationController.pushViewController(vc, animated: true)
    }
}
