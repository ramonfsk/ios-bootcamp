//
//  WeatherData.swift
//  Clima
//
//  Created by Ramon Ferreira on 16/04/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let coord: Coordinates
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Coordinates: Codable {
    let lon: Double
    let lat: Double
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
