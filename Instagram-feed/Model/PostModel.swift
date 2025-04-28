//
//  PostModel.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//
import Foundation

enum PostType {
    case photo(imageName: String)
    case video(videoName: String)
    case photoAndVideo(imageName: String, videoName: String)
}

struct PostModel: Identifiable {
    let id = UUID()
    let username: String
    let profileImageName: String
    let date: String
    let type: PostType
}
