//
//  ImageCacheManager.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//

import SwiftUI

final class ImageCacheManager {
    static let shared = ImageCacheManager()
    
    private init() {}
    
    private let cache = NSCache<NSString, UIImage>()
    
    func image(forKey key: String) -> UIImage? {
        cache.object(forKey: NSString(string: key))
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}
