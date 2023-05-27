//
//  Application.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit

final class Application {
    
    static let shared = Application()
    var window: UIWindow?
    private let networkUseCaseProvider: NetworkProvider
    
    private init() {
        self.networkUseCaseProvider = NetworkProvider()
    }
    func configureMainInterface(in window: UIWindow) {
        self.updateApperance()
        self.window = window
        toStartVC()
        return
    }
    func updateApperance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navBarAppearance.backButtonAppearance = backButtonAppearance
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.standardAppearance = navBarAppearance
    }
    func toStartVC() {
        let navigationController = UINavigationController()
        let navigator = BaseNavigator(services: networkUseCaseProvider, navigationController: navigationController)
        window?.rootViewController = navigationController
        navigator.toStartVc()
    }
}

