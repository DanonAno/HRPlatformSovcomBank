//
//  LoginViewModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 25.05.2023.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class LoginViewModel: ViewModelType {
    
    private let navigator: BaseNavigatorProtocol
    
    init(navigator: BaseNavigatorProtocol) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let emailString = input.email
        let passwordString = input.password
        let toVacancy = input.toNextTrigger
            .do(onNext: {[unowned self] value in
                navigator.toVacancy()
            })
                
            return Output(toVacancyVC: toVacancy)
        }
}
    
    extension LoginViewModel {
        struct Input {
            let email: String
            let password: String
            let toNextTrigger: Driver<Void>
        }
        
        struct Output {
            let toVacancyVC: Driver<Void>
        }
    }
