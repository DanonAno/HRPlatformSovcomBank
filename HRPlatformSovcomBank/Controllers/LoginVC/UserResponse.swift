//
//  UserResponse.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 28.05.2023.
//

import Foundation

struct UserResponse: Decodable {
    let ID: Int
    let CreatedAt: String
    let UpdatedAt: String
    let DeletedAt: String?
    let fullName: String
    let location: String
    let workMode: String
    let photoURL: String
    let post: String
    let role: Int
    let phone: String
    let email: String
    let password: String
    let cvs: String?
    let tests: String?
    
    private enum CodingKeys: String, CodingKey {
        case ID
        case CreatedAt
        case UpdatedAt
        case DeletedAt
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
        case tests
    }
}
