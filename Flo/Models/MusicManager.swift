//
//  MusicManager.swift
//  Flo
//
//  Created by 정성준 on 2021/03/08.
//

import Foundation

protocol MusicManagerDelegate {
    func didUpdateMusic(music: MusicModel)
}

struct MusicManager {
    
    let urlString = "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-flo/song.json"
    
    var delegate: MusicManagerDelegate?
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    
                    if let music = self.parseJSON(musicData: safeData) {
                        delegate?.didUpdateMusic(music: music)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(musicData: Data) -> MusicModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MusicData.self, from: musicData)
            
            let singer = decodedData.singer
            let album = decodedData.album
            let title = decodedData.title
            let imageURL = decodedData.image
            let fileURL = decodedData.file
            let duration = decodedData.duration
            let lyrics = decodedData.lyrics
    
            let music = MusicModel(currentSinger: singer, currentAlbum: album, currentTitle: title, currentImage: imageURL, currentFile: fileURL, currentDuration: duration, currentLyrics: lyrics)
            
            return music
            
        } catch {
            print(error)
            return nil
        }
    }
}
