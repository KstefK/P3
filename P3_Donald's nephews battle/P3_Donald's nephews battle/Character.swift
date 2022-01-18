//
//  Chracter.swift
//  P3_Donald's nephews battle
//
//  Created by Stéphane KERHOAS on 17/11/2021.
//

import Foundation

class Character {
    
    var name: String
    var nickName: String  // Name given to the character
    var weapon: Weapon
    var life: Int
    var strike: Int = 0
    
    
    init(name: String, weapon: Weapon, life: Int) {    // Constructor setting nickname for characters
        
        self.name = name
        self.weapon = weapon
        self.life = life
        
        repeat {
            
            print("Enter a name for your choosen character \(name) :", terminator: " ")
            
            self.nickName = readLine() ?? ""
            
        } while Character.nickNameAlreadyUsed(self.nickName)
        
        Character.nickNames.append(self.nickName)
        
    } // End of init
    
    static var nickNames: [String] = []                               // Array of nickNames to build the team
    static func nickNameAlreadyUsed(_ nickname: String?) -> Bool {   // Function to check if name not already used
        
        if let nickname = nickname {
            
            if nickname == "" {                                      // Check if nickname is not empty else start again select
                
                print("")
                print("❌ Choice incorrect - start again ...")
                print("")
                
                return true
                
            }
            
            if nickNames.contains(nickname) {                        // Display error message in case of nicknname already exists
                
                print("")
                print("⛔️ This nickname already exists !")
                print("❌ Choice incorrect - start again ...")
                print("")
                
            }
            
            return nickNames.contains(nickname)
            
        } else {
            
            return true
            
        }
    }
} // End of class
