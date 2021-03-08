//
//  MusicManager.swift
//  Flo
//
//  Created by 정성준 on 2021/03/08.
//

import Foundation

struct MusicManager {
    let urlString = "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-flo/song.json"
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    
                    print(dataString)
                }
            }
            
            task.resume()
        }
    }
}
