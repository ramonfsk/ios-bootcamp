//
//  StructExample.swift
//  Struct_vs_Classes
//
//  Created by Ramon Ferreira on 01/09/21.
//

import Foundation

struct StructHero {
    var name: String
    var universe: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}
