import Foundation
import AVKit
class SoundManager {
    static let instant = SoundManager()
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case Tada
      
        
    }
    
    func playSound(sound: SoundOption, volume: Float = 1.0) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = volume // Set the volume
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
