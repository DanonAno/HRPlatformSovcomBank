//
//  ViewModelProtocol.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 26.05.2023.
//

import Foundation


protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
