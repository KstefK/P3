//
//  Loulou.swift
//  P3_Donald's nephews battle
//
//  Created by Stéphane KERHOAS on 17/11/2021.
//

import Foundation

class Loulou: Character {
        
    static let lifePoint = Int.random(in: 5...100)
    
    init() {                //Constructor from super class Character
        
        super.init(name: "Loulou", weapon: Bow(), life: Loulou.lifePoint)
        print("👍🏼 great !!")

    } // End of init
}
