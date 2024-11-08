//
//  BrewParameters.swift
//  coffeeapp
//
//  Created by Rome on 11/7/24.
//


import SwiftUI

struct BrewParameters {
    var date = Date()
    var brewStyle = "Espresso"
    var brewer = "Lelit Anna PL41TEM"
    var coffee = "Kirinyaga - KB"
    var dose: String = "17"
    var drinkType = "Cortado"
    var grindSetting: String = "4.5"
    var grinder = "Lelit Anna PL41TEM"
    var milk = "Oat"
    var prep = "WDT, RDT"
    var temperature: String = "195"
    var time: String = "00:23"
    var yield: String = "32"
    var notes = ""
    
    // Sample data for pickers
    static let brewStyles = ["Espresso", "Pour Over", "French Press", "Aeropress", "Moka Pot"]
    static let drinkTypes = ["Espresso", "Cortado", "Cappuccino", "Latte", "Americano"]
    static let milkTypes = ["None", "Whole", "Oat", "Almond", "Soy"]
    static let prepMethods = ["WDT, RDT", "WDT", "RDT", "None"]
}
