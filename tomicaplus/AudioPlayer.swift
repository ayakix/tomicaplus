//
//  AudioPlayer.swift
//  tomicaplus
//
//  Created by Ryota Ayaki on 2020/05/12.
//  Copyright © 2020 Ryota Ayaki. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var isPlaying = false
    private var audioPlayer: AVAudioPlayer!
    
    func startPlayback(audioPath: URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            if audioPlayer != nil && isPlaying {
                stopPlayback()
            }
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath)
            audioPlayer.delegate = self
            audioPlayer.play()
            isPlaying = true
        } catch {
            print("Playback failed.")
        }
    }
    
    func stopPlayback() {
        guard isPlaying else {
            return
        }
        audioPlayer.stop()
        isPlaying = false
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            isPlaying = false
        }
    }
}
