//
//  File.swift
//  Xylophone
//
//  Created by Konstantin Krokhin on 18/02/2023.
//  Copyright © 2023. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print(sender.currentTitle as Any)
        playSound(key: sender.currentTitle!)
        sender.layer.opacity = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
        {
            sender.layer.opacity = 1
        }
        
    }
    
    func playSound(key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
