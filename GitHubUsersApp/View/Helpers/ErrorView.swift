//
//  ErrorView.swift
//  GitHubUsersApp
//
//  Created by Yuriy Pashkov on 21.06.2023.
//

import SwiftUI

struct ErrorView: View {
    
    @State var error: AppError
    @Binding var isAlertShows: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("Ooops...")
                    .font(.title2)
                    .bold()
                    .padding()
                
                Group {
                    Text("We have an error:\n") + Text(error.description).bold()
                }.multilineTextAlignment(.center).padding(.bottom, 16)
                
                Button(action: {
                    isAlertShows = false
                }, label: {
                    Text("Ok")
                        .bold()
                        .foregroundColor(.white)
                })
                .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
                .background(.mint)
                .cornerRadius(12)
                .padding(.bottom, 16)
                
            }
            .frame(width: 222)
            .background(.white)
            .cornerRadius(16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.33))
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: .invalidData, isAlertShows: .constant(true))
    }
}


