//
//  ExchangeRateData.swift
//  ByteCoin
//
//  Created by Ramon Ferreira on 05/08/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
