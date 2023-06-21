//
//  GitHubUser.swift
//  GitHubUsersApp
//
//  Created by Yuriy Pashkov on 19.06.2023.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    let bio: String? // sometimes bio is null in server response
}
