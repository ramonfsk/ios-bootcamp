//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTxtFld: UITextField!
    
    @IBOutlet weak var zeroPcBtn: UIButton!
    @IBOutlet weak var tenPcBtn: UIButton!
    @IBOutlet weak var twentyPcBtn: UIButton!
    
    @IBOutlet weak var splitNumberLbl: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var billTotalStr = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTxtFld.endEditing(true)
        
        zeroPcBtn.isSelected = false
        tenPcBtn.isSelected = false
        twentyPcBtn.isSelected = false
        
        sender.isSelected = true
        
        let percent = Double(String(sender.currentTitle!.dropLast()))!
        
        tip = percent / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLbl.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTxtFld.text! != "" {
            billTotal = Double(billTxtFld.text!)!
            billTotalStr = String(format: "%.2f", (billTotal * (1 + tip) / Double(numberOfPeople)))

        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = billTotalStr
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
}

