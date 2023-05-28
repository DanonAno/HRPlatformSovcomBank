//
//  VacancyModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 26.05.2023.
//

import Foundation

struct ResponseModel: Decodable {
    let id: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let title: String
    let company: String
    let description: String
    let templates: [TemplateModel]
    
    private enum CodingKeys: String, CodingKey {
        case id = "ID"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
        case deletedAt = "DeletedAt"
        case title
        case company
        case description
        case templates
    }
}

struct TemplateModel: Decodable {
    let id: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let vacancyId: Int
    let title: String
    let description: String
    private enum CodingKeys: String, CodingKey {
        case id = "ID"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
        case deletedAt = "DeletedAt"
        case vacancyId
        case title
        case description
    }
}
