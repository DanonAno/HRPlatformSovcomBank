//
//  FillProfileViewModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 28.05.2023.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

struct ProfileSection {
    var items: [ProfileItem]
}

extension ProfileSection: SectionModelType {
    init(original: ProfileSection, items: [ProfileItem]) {
        self = original
        self.items = items
    }
}

enum ProfileItem {
    case firstName
    case lastName
    case desiredPosition
    case location
    case employmentType
    case phoneNumber
    case email
}

class ProfileFillViewModel {
    
    let sections: Observable<[ProfileSection]>
    
    init() {
        sections = Observable.just([
            ProfileSection(items: [.lastName, .firstName, .desiredPosition, .location, .employmentType, .phoneNumber, .email])
        ])
    }
    
    func saveProfile() {
        // TODO: POST RUSTAM API
    }
}

