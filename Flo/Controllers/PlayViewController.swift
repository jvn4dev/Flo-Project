//
//  ViewController.swift
//  Flo
//
//  Created by 정성준 on 2021/03/08.
//

import UIKit

class PlayViewController: UIViewController {
    
    var musicManager = MusicManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewDidLoad")
        musicManager.performRequest(urlString: musicManager.urlString)
    }



}

