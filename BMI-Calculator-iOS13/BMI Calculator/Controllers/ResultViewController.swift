//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Ramon Ferreira on 25/03/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var backgroundColor: UIColor?

    @IBOutlet weak var bmiLbl: UILabel!
    @IBOutlet weak var adviceLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLbl.text = bmiValue
        adviceLbl.text = advice
        view.backgroundColor = backgroundColor
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
