//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLbl: UILabel!
    @IBOutlet weak var choice1Btn: UIButton!
    @IBOutlet weak var choice2Btn: UIButton!
    
    var storyBrain = StoryBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func coicheMade(_ sender: UIButton) {
        let userChoice = sender.currentTitle!
        storyBrain.nextStory(userChoice)
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let story = storyBrain.getStory()
        storyLbl.text = story.title
        choice1Btn.setTitle(story.choice1, for: .normal)
        choice2Btn.setTitle(story.choice2, for: .normal)
    }
}
