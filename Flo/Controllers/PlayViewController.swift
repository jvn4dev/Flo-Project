//
//  ViewController.swift
//  Flo
//
//  Created by 정성준 on 2021/03/08.
//

import UIKit

class PlayViewController: UIViewController, MusicManagerDelegate {
    
    
    var musicManager = MusicManager()
    
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicManager.delegate = self
        
        musicManager.performRequest(urlString: musicManager.urlString)
        
        
    }
    
    func didUpdateMusic(music: MusicModel) {
        
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
    
    
}

