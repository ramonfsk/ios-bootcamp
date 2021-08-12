//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ramon Ferreira on 13/04/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var settingsLbl: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLbl.text = result
        settingsLbl.text = "Split betwen \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
