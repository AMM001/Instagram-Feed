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
    let play: Bool
    
    @State private var player: AVPlayer?
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                if player == nil {
                    if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
                        player = AVPlayer(url: url)
                        player?.isMuted = true
                    }
                }
            }
            .onChange(of: play) { isPlaying in
                if isPlaying {
                    player?.play()
                } else {
                    player?.pause()
                }
            }
    }
}

