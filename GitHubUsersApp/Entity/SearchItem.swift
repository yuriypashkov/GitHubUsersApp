//
//  SearchItem.swift
//  GitHubUsersApp
//
//  Created by Yuriy Pashkov on 19.06.2023.
//

import Foundation

struct SearchItem: Identifiable, Codable {
    let login: String
    let id: Int
    let avatarUrl: String
}

struct SearchItems: Codable {
    let items: [SearchItem]
}
