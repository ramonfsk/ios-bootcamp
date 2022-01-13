//
//  FilePlistService.swift
//  Twittermenti
//
//  Created by Ramon Ferreira do Nascimento on 12/01/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct Secret: Decodable {
    let APIKey, APISecret: String
}

final class FilePlistService {
    static func getAPISecretsFromPlist() -> Secret? {
        if let path = Bundle.main.url(forResource: "Secrets", withExtension: "plist") {
            do {
                let data = try Data(contentsOf: path)
                if let dictPlist = try? PropertyListDecoder().decode(Secret.self, from: data) {
                    return dictPlist
                }
            } catch { print(error) }
        }
        
        return nil
    }
}
