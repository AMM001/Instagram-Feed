//
//  PostModel.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//
import Foundation

enum MediaType: Identifiable {
    var id: UUID { UUID() }
    case photo(imageName: String)
    case video(videoName: String)
}

struct PostModel: Identifiable {
    let id = UUID()
    let username: String
    let profileImageName: String
    let date: String
    let media: [MediaType]
}
