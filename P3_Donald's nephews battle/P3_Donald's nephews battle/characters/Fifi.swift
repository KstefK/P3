//
//  Fifi.swift
//  P3_Donald's nephews battle
//
//  Created by Stéphane KERHOAS on 17/11/2021.
//

import Foundation

class Fifi: Character {
    
    static let lifePoint = Int.random(in: 30...100)
    
    init() {                 //Constructor with super class Character
        
        super.init(name: "Fifi", weapon: SlingShot(), life: Fifi.lifePoint)
        print("👍🏼 great !!")
    
    } // End of init
}
