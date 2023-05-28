//
//  MenuViewModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import Foundation
import RxSwift
import RxCocoa

class MenuViewModel: ViewModelType {
    let navigator: MenuNavigator!
    
    init(navigator: MenuNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let toNext = input.cellTrigger
            .do(onNext: { [unowned self] value in
                switch value {
                case "Главная":
                    navigator.toProfile()
                case "Вакансии":
                    navigator.toProfile()
                case "Отклики":
                    navigator.toProfile()
                case "Профиль":
                    navigator.toProfile()
                default:
                    break
                }
            })
                return Output(toNextScreen: toNext)
    }
}

extension MenuViewModel {
    struct Input {
        var cellTrigger: Driver<String>
    }
    struct Output {
        var toNextScreen: SharedSequence<DriverSharingStrategy, String>
    }
}
