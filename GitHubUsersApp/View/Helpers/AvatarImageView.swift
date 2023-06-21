//
//  AvatarImageView.swift
//  GitHubUsersApp
//
//  Created by Yuriy Pashkov on 20.06.2023.
//

import SwiftUI

struct AvatarImageView: View {
    
    @State var size: CGFloat = 0
    @State var url: String = ""
    
    var body: some View {
        
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        } placeholder: {
            Circle()
                .foregroundColor(.gray)
        }
        .frame(width: size, height: size)
        
    }
}

//struct AvatarImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        AvatarImageView()
//    }
//}
