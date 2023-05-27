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
            return "main"
        case .vacancies:
            return "vacancies"
        case .responses:
            return "responses"
        case .profile:
            return "profile"
        case .exit:
            return "exit"
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
