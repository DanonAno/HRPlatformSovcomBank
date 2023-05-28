//
//  UserResponse.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 28.05.2023.
//

import Foundation

struct UserResponse: Codable {
    let id: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let fullName: String
    let location: String
    let workMode: String
    let photoURL: String
    let post: String
    let role: Int
    let phone: String
    let email: String
    let password: String
    let cvs: [CVModel]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "ID"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
        case deletedAt = "DeletedAt"
        case fullName
        case location
        case workMode
        case photoURL
        case post
        case role
        case phone
        case email
        case password
        case cvs
    }
}

struct CVModel: Codable {
    let id: Int
    let title: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title
        case description
    }
}
