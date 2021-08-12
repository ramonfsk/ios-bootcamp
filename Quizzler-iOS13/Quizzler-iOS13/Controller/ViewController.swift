//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        scoreLbl.text = "Score: \(quizBrain.getScore())"
        questionLbl.text = quizBrain.getQuestionText()
        
        let answers = quizBrain.getAnswers()
        option1Btn.setTitle(answers[0], for: .normal)
        option2Btn.setTitle(answers[1], for: .normal)
        option3Btn.setTitle(answers[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
        option1Btn.backgroundColor = UIColor.clear
        option2Btn.backgroundColor = UIColor.clear
        option3Btn.backgroundColor = UIColor.clear
    }
}
