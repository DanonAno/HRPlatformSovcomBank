//
//  AddResumeViewModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 28.05.2023.
//

import UIKit
import RxSwift
import RxCocoa

class AddResumeViewModel: ViewModelType {
    
    func transform(input: Input) -> Output {
        
        let trigger = input.cellTapTrigger
            .do(onNext: { [unowned self] value in
                
            })
        return Output(toCreateNewResume: trigger)
    }
    
    
}

extension AddResumeViewModel {
    struct Input {
        let cellTapTrigger: Driver<Void>
        
    }
    
    struct Output {
        let toCreateNewResume: Driver<Void>
        
    }
}
