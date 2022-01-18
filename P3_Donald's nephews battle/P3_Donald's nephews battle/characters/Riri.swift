//
//  Riri.swift
//  P3_Donald's nephews battle
//
//  Created by Stéphane KERHOAS on 17/11/2021.
//

import Foundation

class Riri: Character {
    
    static let lifePoint = Int.random(in: 50...100)
    
    init() {                //Constructor with  super class Character
        
        super.init(name: "Riri", weapon: Stick(), life: Riri.lifePoint)
        print("👍🏼 great !!")
    
    } // End of init
        
}
