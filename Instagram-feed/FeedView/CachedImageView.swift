//
//  CachedImageView.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//

import Foundation
import SwiftUI

struct CachedImageView: View {
    let imageName: String
    @State private var image: UIImage?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else {
                Image("placeholder") // Placeholder
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }
    
    private func loadImage() {
        if let cached = ImageCacheManager.shared.image(forKey: imageName) {
            self.image = cached
            return
        }
        
        if let uiImage = UIImage(named: imageName) {
            ImageCacheManager.shared.setImage(uiImage, forKey: imageName)
            self.image = uiImage
        }
    }
}
