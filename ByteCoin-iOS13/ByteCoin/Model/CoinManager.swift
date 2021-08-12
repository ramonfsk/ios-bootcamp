//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "EB4FF88D-B4B0-4CC9-8354-0E2E611867FF"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    weak var delegate: CoinManagerDelegate?

    func getCointPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apiKey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        do {
            let decodeData = try JSONDecoder().decode(CoinData.self, from: coinData)
            
            let time = decodeData.time
            let currencyBase = decodeData.asset_id_base
            let currencyQuote = decodeData.asset_id_quote
            let currencyValue = decodeData.rate
            
            let coin = CoinModel(
                time: time,
                currencyBase: currencyBase,
                currencyQuote: currencyQuote,
                currencyValue: currencyValue
            )
            
            return coin
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
