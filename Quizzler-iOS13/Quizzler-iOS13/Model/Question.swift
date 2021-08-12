//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ramon Ferreira on 11/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
