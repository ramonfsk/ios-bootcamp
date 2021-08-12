//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let c1Destination: Int
    let choice2: String
    let c2Destination: Int
    
    init(t: String, c1: String, c1Destination:Int, c2: String, c2Destination: Int) {
        self.title = t
        self.choice1 = c1
        self.c1Destination = c1Destination
        self.choice2 = c2
        self.c2Destination = c2Destination
    }
}
