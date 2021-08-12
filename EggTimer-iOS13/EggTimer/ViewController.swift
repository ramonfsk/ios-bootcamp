//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

let soundName = "alarm_sound"
let soundExtension = "mp3"

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLbl.text = hardness
        
        startTimer(seconds: eggTimes[hardness]!)
    }
    
    func startTimer(seconds: Int) {
        totalTime = seconds
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLbl.text = "DONE"
            playSound(soundName: soundName, soundExtension: soundExtension)
        }
    }
    
    func playSound(soundName: String, soundExtension: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: soundExtension)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
