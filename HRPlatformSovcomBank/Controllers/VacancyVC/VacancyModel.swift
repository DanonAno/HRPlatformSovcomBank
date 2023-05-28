//
//  VacancyModel.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 26.05.2023.
//

import Foundation

struct VacancyModel: Decodable {
    let id: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let title: String
    let company: String
    let description: String
    let templates: [TemplateModel]
    let status: Int
    let applies: String?
}

struct TemplateModel: Decodable {
    let id: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let vacancyId: Int
    let title: String
    let description: String
}

