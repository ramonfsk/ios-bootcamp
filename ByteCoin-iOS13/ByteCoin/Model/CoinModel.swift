//
//  ExchangeRateModel.swift
//  ByteCoin
//
//  Created by Ramon Ferreira on 05/08/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let time: String
    let currencyBase: String
    let currencyQuote: String
    let currencyValue: Double
    
    var currencyValueString: String {
        return String(format: "%.2f", currencyValue)
    }
}
