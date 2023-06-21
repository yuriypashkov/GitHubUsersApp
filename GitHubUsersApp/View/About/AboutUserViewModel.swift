//
//  AboutUserViewModel.swift
//  GitHubUsersApp
//
//  Created by Yuriy Pashkov on 20.06.2023.
//

import Foundation

class AboutUserViewModel: ObservableObject {
    
    @Published var user: User?
    
    @MainActor
    func getUser(username: String) async throws {
        let endpoint = "https://api.github.com/users/\(username)"
        
        guard let url = URL(string: endpoint) else {
            throw AppError.invalidUrl
        }
        
        var data: Data
        var response: URLResponse
        
        do {
            (data, response) = try await URLSession.shared.data(from: url)
        } catch {
            throw AppError.networkProblem
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw AppError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            user = try decoder.decode(User.self, from: data)
        } catch {
            throw AppError.invalidData
        }
    }
    
}
