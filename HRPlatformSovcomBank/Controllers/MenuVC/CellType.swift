//
//  CellType.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import Foundation
import RxSwift
import RxCocoa

enum CellType {
    case main
    case vacancies
    case responses
    case profile
    case exit
    
    var action: String {
        switch self {
        case .main:
            return "Главная"
        case .vacancies:
            return "Вакансии"
        case .responses:
            return "Отклики"
        case .profile:
            return "Профиль"
        case .exit:
            return "Выход"
        }
    }
    
    var image: UIImage {
        switch self {
        case .main:
            return UIImage(named: "mainVC")!
        case .vacancies:
            return UIImage(named: "VacanciesVC")!
        case .responses:
            return UIImage(named: "ResponsesVC")!
        case .profile:
            return UIImage(named: "ProfileVC")!
        case .exit:
            return UIImage(named: "Exit")!
        }
    }
}
