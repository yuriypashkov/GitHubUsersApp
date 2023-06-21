//
//  AppError.swift
//  GitHubUsersApp
//
//  Created by Yuriy Pashkov on 19.06.2023.
//

import Foundation

enum AppError: Error {
    case networkProblem
    case invalidUrl
    case invalidResponse
    case invalidData
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .invalidData:
            return "Invalid data"
        case .networkProblem:
            return "Network problem"
        }
    }
}
