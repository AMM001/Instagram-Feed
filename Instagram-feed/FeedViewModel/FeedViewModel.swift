//
//  FeedViewModel.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//

import Foundation
class FeedViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        loadMockPosts()
    }
    
    private func loadMockPosts() {
        posts = [
            .init(
                username: "hamza_dev",
                profileImageName: "user_1",
                date: "2h ago",
                media: [
                    .photo(imageName: "post_1")
                ]
            ),
            .init(
                username: "hamza_dev",
                profileImageName: "user_2",
                date: "2h ago",
                media: [
                    .photo(imageName: "post_6")
                ]
            ),
            .init(
                username: "hamza_dev",
                profileImageName: "user_3",
                date: "2h ago",
                media: [
                    .photo(imageName: "post_7")
                ]
            ),
            .init(
                username: "john_appleseed",
                profileImageName: "user_2",
                date: "5h ago",
                media: [
                    .video(videoName: "reel_6")
                ]
            ),
            .init(
                username: "jane_doe",
                profileImageName: "user_3",
                date: "1d ago",
                media: [
                    .photo(imageName: "post_2"),
                    .video(videoName: "reel_7")
                ]
            ),
            .init(
                username: "hamza_dev",
                profileImageName: "user_1",
                date: "2h ago",
                media: [
                    .photo(imageName: "post_3")
                ]
            ),
            .init(
                username: "john_appleseed",
                profileImageName: "user_3",
                date: "5h ago",
                media: [
                    .video(videoName: "reel_3")
                ]
            ),
            .init(
                username: "jane_doe",
                profileImageName: "user_4",
                date: "1d ago",
                media: [
                    .photo(imageName: "post_3"),
                    .video(videoName: "reel_3")
                ]
            )
            // Add more posts if you want!
        ]
    }
    
}
