//
//  PostCellView.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//

import SwiftUI

struct PostCellView: View {
    let post: PostModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Header (profile photo, username, date)
            HStack {
                Image(post.profileImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.username)
                        .font(.headline)
                    Text(post.date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            
            // Content (photo / video / photo+video)
            contentView
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 4)
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch post.type {
        case .photo(let imageName):
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
        case .video(let videoName):
            AutoPlayVideoPlayer(videoName: videoName)
        case .photoAndVideo(let imageName, let videoName):
            VStack(spacing: 8) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                AutoPlayVideoPlayer(videoName: videoName)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PostCellView(post: PostModel(
        username: "hamza_dev",
        profileImageName: "user_1",
        date: "2h ago",
        type: .photo(imageName: "post_1")
    ))
}



