//
//  WorkExperienceSectionModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 24.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

struct WorkExperienceSectionModel {
    var header: String
    var items: [Item]
}

extension WorkExperienceSectionModel: SectionModelType {
    typealias Item = WorkExperience
    
    init(original: WorkExperienceSectionModel, items: [Item]) {
        self = original
        self.items = items
    }
}
