//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var heightSldr: UISlider!
    @IBOutlet weak var weightSldr: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLbl.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLbl.text = String(format: "%.0fKg", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSldr.value
        let weight = weightSldr.value
        
        calculatorBrain.calculateBMI(height, weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.backgroundColor = calculatorBrain.getColor()
        }
    }
}
