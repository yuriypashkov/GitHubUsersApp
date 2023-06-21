//
//  ContentView.swift
//  GitHubUsersApp
//
//  Created by Yuriy Pashkov on 19.06.2023.
//

import SwiftUI

struct AboutUserView: View {

    @StateObject var viewModel: AboutUserViewModel = AboutUserViewModel()
    var login: String
    
    var body: some View {
        VStack(spacing: 20) {
            //AvatarImageView(size: 120, url: viewModel.user?.avatarUrl ?? "")
            AsyncImage(url: URL(string: viewModel.user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 120, height: 120)
            
            Text(viewModel.user?.login ?? "User Placeholder")
                .bold()
                .font(.title3)
            
            Text(viewModel.user?.bio ?? "Bio not found :(")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do {
                try await viewModel.getUser(username: login)
            } catch {
                print(error)
            }
        }
    }
}

struct AboutUserView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUserView(login: "yuriypashkov")
    }
}




