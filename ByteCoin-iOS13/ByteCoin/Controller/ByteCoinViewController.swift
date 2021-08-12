//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ByteCoinViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currencyPicker.delegate = self
        self.currencyPicker.dataSource = self
        self.coinManager.delegate = self
    }
}

extension ByteCoinViewController: CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.currencyLabel.text = coin.currencyValueString
            self.bitcoinLabel.text = coin.currencyQuote
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension ByteCoinViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCointPrice(for: selectedCurrency)
    }
}

extension ByteCoinViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.coinManager.currencyArray.count
    }
}

