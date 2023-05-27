//
//  BaseNavigator.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit
import SnapKit


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
        titleLabel.textColor = .primary500
        titleLabel.font = UIFont.systemFont(ofSize: 32)
        titleLabel.sizeToFit()
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
        let menuImage = UIImage(named: "Menu")
        let menuButton = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(openMenu))
        vc.navigationItem.rightBarButtonItem = menuButton
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    @objc func openMenu() {
        toMenu()
    }
    
    func toMenu() {
        let vc = MenuViewController()
        let imageView = UIImageView(image: UIImage(named: "sovkomPeople"))
        imageView.contentMode = .scaleAspectFit
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 227, height: 64))
        customView.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.left.equalTo(imageView.snp.left)
            make.right.equalTo(imageView.snp.right)
            make.bottom.equalTo(imageView.snp.bottom)
        }
        
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)

        let clouseImage = UIImage(named: "clouseButton")
        let clouseButton = UIBarButtonItem(image: clouseImage, style: .plain, target: self, action: #selector(dismissViewController))
        vc.navigationItem.rightBarButtonItem = clouseButton
        navigationController.pushViewController(vc, animated: true)
    }
    
    @objc func dismissViewController() {
        navigationController.popViewController(animated: true)
    }
}
