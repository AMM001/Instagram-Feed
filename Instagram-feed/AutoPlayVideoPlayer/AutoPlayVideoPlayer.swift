//
//  AutoPlayVideoPlayer.swift
//  Instagram-feed
//
//  Created by Men3m on 28/04/2025.
//

import SwiftUI
import AVKit

struct AutoPlayVideoPlayer: View {
    let videoName: String
    @State private var player: AVPlayer?
    
    var body: some View {
        GeometryReader { geo in
            VideoPlayer(player: player)
                .frame(height: 300)
                .cornerRadius(10)
                .onAppear {
                    if player == nil {
                        if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
                            print("✅ Found video: \(url)")
                            player = AVPlayer(url: url)
                            player?.isMuted = true
                            player?.play()
                        }else{
                            print("❌ Video not found: \(videoName).mp4")
                        }
                    }
                }
                .onChange(of: geo.frame(in: .global).midY) { value in
                    guard let player = player else { return }
                    
                    let screenHeight = UIScreen.main.bounds.height
                    
                    if value > 100 && value < screenHeight - 100 {
                        if player.timeControlStatus != .playing {
                            player.play()
                        }
                    } else {
                        if player.timeControlStatus == .playing {
                            player.pause()
                        }
                    }
                }
        }
        .frame(height: 300)
    }
}
