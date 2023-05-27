//
//  LoginViewModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 25.05.2023.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: ViewModelType {
    
    private let navigator: BaseNavigatorProtocol
    
    init(navigator: BaseNavigatorProtocol) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        
        let toVacancy = input.toNextTrigger
            .do { [unowned self] value in
                self.navigator.toVacancy()
            }
        return Output(toVacancyVC: toVacancy)
    }
}

extension LoginViewModel {
    struct Input {
        let toNextTrigger: Driver<Void>
    }
    
    struct Output {
        let toVacancyVC: Driver<Void>
    }
}
