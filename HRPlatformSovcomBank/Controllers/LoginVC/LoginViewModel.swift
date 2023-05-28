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
            .flatMapLatest { [unowned self] _ -> Driver<Void> in
                return signIn(email: emailString, password: passwordString)
                    .flatMapLatest { result -> Driver<Void> in
                        if result {
                            self.navigator.toVacancy()
                            return Driver.empty()
                        } else {
                            let error = NSError(domain: "Login Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to sign in."])
//                            self.navigator.showErrorAlert(error)
                            return Driver.empty()
                        }
                    }
                    .asDriver(onErrorJustReturn: ())
            }
        
        return Output(toVacancyVC: toVacancy)
    }
    
    private func signIn(email: String, password: String) -> Observable<Bool> {
            print("AGA", email, password)
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        let url = "http://158.160.34.74:8080/auth/signIn"
        
        return Observable.create { observer in
            AF.request(url, method: .post, parameters: parameters)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        print("#TUTU", response)
                        observer.onNext(true) // Sign in successful
                        observer.onCompleted()
                    case .failure(let error):
                        print("error\(error)")
                        observer.onNext(false) // Sign in failed
                        observer.onError(error)
                    }
                }
            
            return Disposables.create()
        }
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
