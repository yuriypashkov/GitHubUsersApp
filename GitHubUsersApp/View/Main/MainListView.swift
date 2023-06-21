//
//  MainListView.swift
//  GitHubUsersApp
//
//  Created by Yuriy Pashkov on 19.06.2023.
//

import SwiftUI

struct MainListView: View {
    
    @StateObject var viewModel: MainListViewModel = MainListViewModel()
    @State var searchText: String = ""
    
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.items) { item in
                    ZStack(alignment: .leading) {
                        HStack {
                            AvatarImageView(size: 48, url: item.avatarUrl)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.login)
                                    .bold()
                                    .font(.title3)
                                
                                Text(String(item.id))
                                    .font(.system(size: 14))
                            }
                        }
                        
                        NavigationLink(destination: AboutUserView(login: item.login)) {}
                        //.opacity(0)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Users")
                .searchable(text: $searchText)
                .onSubmit(of: .search) {
                    guard !searchText.isEmpty else {
                        print("Empty text")
                        return
                    }
                    
                    viewModel.clearItems()
                    
                    Task {
                        do {
                            try await viewModel.getUsers(query: searchText)
                        } catch {
                            print(error)
                        }
                    }
                    
                }
                
                if viewModel.isFetching {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .opacity(viewModel.isFetching ? 1 : 0)
                } else {
                    Text("Try to find users on GitHub.\n Write something in search bar and tap Search")
                        .opacity(viewModel.items.isEmpty ? 1 : 0)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                if viewModel.isAlertShows {
                    ErrorView(error: viewModel.error ?? .invalidData, isAlertShows: $viewModel.isAlertShows)
                }

            }
        } // navigation view ended
    }
    
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
