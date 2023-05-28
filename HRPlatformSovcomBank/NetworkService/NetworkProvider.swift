//
//  NetworkProvider.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import Foundation


final class NetworkProvider {
    //MARK: - Api Endpoint
    static let apiProvider = "158.160.34.74:8080/"
    // Auth
    static let auth = "auth/signIn"
    static let signUp = "auth/signUp"
    //Vacancy
    static let createVacancy = "/api/vacancies"
    static let getAllVacancies = "/api/vacancies/"
    //Get user
    static let getUser = "/api/users/"
    //Add Test
    static let addTest = "/api/testTask"
    //Add CV
    static let addCV = "/api/cv"
    //Add Apply
    static let addAply = "/api/applies"
    // Get Vacancy
    static let getVacancy = "/api/vacancies/"
}
