//
//  MusicData.swift
//  Flo
//
//  Created by 정성준 on 2021/03/09.
//

import Foundation

struct MusicData: Decodable {
    var singer: String
    var album: String
    var title: String
    var image: String
    var file: String
    var duration: Int
    var lyrics: String
    
    
}
