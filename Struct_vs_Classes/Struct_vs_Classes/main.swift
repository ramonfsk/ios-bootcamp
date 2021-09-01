//
//  main.swift
//  Struct_vs_Classes
//
//  Created by Ramon Ferreira on 01/09/21.
//

import Foundation

var hero = StructHero(name: "Iron Man", universe: "Marvel")

//var anotherMarvelHero = hero
//anotherMarvelHero.name = "The Hulk"
//
//var avengers = [hero, anotherMarvelHero]
//
//avengers[0].name = "Thor"
//
//print("hero name = \(hero.name)")
//print("anotherMarvelHero name = \(anotherMarvelHero.name)")
//print("first avenger name = \(avengers[0].name)")

print(hero.reverseName())
