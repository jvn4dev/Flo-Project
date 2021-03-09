//
//  ViewController.swift
//  Flo
//
//  Created by 정성준 on 2021/03/08.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController, MusicManagerDelegate {
    
    var player: AVPlayer?
    
    var musicManager = MusicManager()
    var songURL: String?
    
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var progressBar: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewDidLoad")
        
        musicManager.delegate = self
        
        musicManager.performRequest(urlString: musicManager.urlString)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
    }
    
    func didUpdateMusic(music: MusicModel) {
        
        songURL = music.currentFile
        guard let url = URL(string: songURL ?? "None") else {
            return
        }
        let playerItem: AVPlayerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
            
        
        DispatchQueue.main.async {
            self.musicTitleLabel.text = music.currentTitle
            self.singerLabel.text = music.currentSinger
            
            let url = URL(string: music.currentImage)
            do {
                let data = try Data(contentsOf: url!)
                self.albumImage.image = UIImage(data: data)
                
            } catch {
                print("Failed to convert url to image \(error)")
            }
        }
        
    }
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
        if player?.rate == 0 {
            player!.play()
        } else {
            player!.pause()
        }
    }

}

