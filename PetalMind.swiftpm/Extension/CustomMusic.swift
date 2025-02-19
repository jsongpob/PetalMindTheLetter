//
//  CustomeMusic.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 19/2/2568 BE.
//

import AVFoundation

class CustomMusic: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    
    init() {
        if let sound = Bundle.main.path(forResource: "inspiring-emotional-uplifting-piano", ofType: "mp3") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            } catch {
                print("AudioPlayer Error")
            }
        } else {
            print("Audio file cloud not be found")
        }
    }
    
    func playOrPause() {
        guard let player = audioPlayer else { return }
        
        if (player.isPlaying) {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            player.numberOfLoops = -1
            isPlaying = true
        }
    }
}
