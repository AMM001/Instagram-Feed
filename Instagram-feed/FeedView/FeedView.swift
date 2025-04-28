//
//  FeedView.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.posts) { post in
                    PostCellView(post: post)
                }
            }
            .padding()
        }
    }
}

#Preview {
    FeedView()
}
