//
//  PostCellView.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//

import SwiftUI
import AVKit

struct PostCellView: View {
    let post: PostModel
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Top profile
            HStack {
                CachedImageView(imageName: post.profileImageName)
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(post.username)
                        .font(.headline)
                    Text(post.date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            
            // Horizontal Pager
            TabView(selection: $currentIndex) {
                ForEach(Array(post.media.enumerated()), id: \.offset) { index, mediaItem in
                    Group {
                        switch mediaItem {
                        case .photo(let imageName):
                            CachedImageView(imageName: imageName)
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 400)
                                .clipped()
                        case .video(let videoName):
                            AutoPlayVideoPlayer(videoName: videoName, play: currentIndex == index)
                                .frame(width: UIScreen.main.bounds.width, height: 400)
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PostCellView(
        post: PostModel(
            username: "hamza_dev",
            profileImageName: "user_1",
            date: "2h ago",
            media: [
                .photo(imageName: "post_1"),
                .video(videoName: "reel_1")
            ]
        )
    )
}



