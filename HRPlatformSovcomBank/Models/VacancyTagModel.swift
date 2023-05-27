//
//  VacancyTagModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 26.05.2023.
//

import Foundation


enum UserRole: UInt {
    case applicant = 1
    case recruiter = 2
    case customer = 3
}

enum TestType: UInt {
    case test = 1
    case call = 2
}

enum VacancyStatus: UInt {
    case searching = 1
    case interview = 2
    case newVacancy = 3
    case closed = 4
    
    var context: String {
        switch self {
        case .searching:
            return "Поиск"
        case .interview:
            return "Собеседования"
        case .newVacancy:
            return "Новый"
        case .closed:
            return ""
        }
    }
}


enum ApplyStatus: UInt {
    case reject = 1
    case invite = 2
    case wait = 3
}

enum StageType: UInt {
    case test = 1
    case call = 2
}

enum Rating: UInt {
    case none = 0
}

struct User {
    let fullName: String
    let role: UserRole
    let phone: String
    let email: String
    let password: String
    let cvs: [CV]
}

struct Vacancy {
    let title: String
    let company: String
    let description: String
    let templates: [VacancyTemplate]
    let status: VacancyStatus
    let applies: [Apply]
}

struct Apply {
    let vacancyId: UInt
    let cvId: UInt
    let comment: String
    let status: ApplyStatus
    let stages: [Stage]
}

struct Stage {
    let applyId: UInt
    let type: StageType
    let rating: Rating
    let test: Test?
    let call: Call?
}

struct Call {
    
}

struct Test {
    let title: String
    let description: String
    let questions: [Question]
}

struct Question {
    let testId: UInt
    let title: String
    let description: String
    let variants: [QuestionVariant]
    let answer: QuestionVariant
}

struct QuestionVariant {
    let questionId: UInt
    let text: String
}

struct VacancyTemplate {
    let vacancyId: UInt
    let title: String
    let description: String
}

struct CV {
    let title: String
    let about: String
    let userId: UInt
    let blocks: [CVTemplate]
    let applies: [Apply]
}

struct CVTemplate {
    let cvId: UInt
    let title: String
    let strokes: [Experience]
}

struct Experience {
    let cvTemplateId: UInt
    let title: String
    let subtitle: String
    let description: String
    let dateFrom: Date
    let dateTo: Date
}
