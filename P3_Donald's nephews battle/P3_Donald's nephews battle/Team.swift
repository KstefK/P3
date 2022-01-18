//
//  Team.swift
//  P3_Donald's nephews battle
//
//  Created by Stéphane KERHOAS on 17/11/2021.
//

import Foundation

class Team {
    
    var characters: [Character]           //Array of characters
    var choice: Int = 0                 // helper for building the init
    var counter: Int = 0              // number of fighting strike
    var teamNumber = 0               // The number of the team for statistics
    
    
    var aliveCharacters: [Character] {  // Return an array of alive characters
        return characters.filter { $0.life > 0 }
    }
    
    
    init() {                        //constructor building the team of characters
        
        characters = []
        
        while characters.count < 3 {  // Team will have 3 characters ...
            print("✔️✔️✔️")
            if characters.count == 0 {
                print("👥 -> Choose a character then press ENTER :")
                print("-------------------------------------------")
                
            } else if characters.count == 1 {
                print("👥 -> Choose a second character then press ENTER :")
                print("-------------------------------------------------")
                
            } else if characters.count == 2 {
                print("👥 -> Choose your last character then press ENTER :")
                print("---------------------------------------------------")
            }
            
            print("")
            print("1: 🥷🏻 Riri")
            print("2: 🥷🏻 Fifi")
            print("3: 🥷🏻 Loulou")
            print("")
            
            
            
            switch readLine() {   // Append a character to the array
                
            case "1": characters.append(Riri())
                
                print("")
                
            case "2": characters.append(Fifi())
                
                print("")
                
            case "3": characters.append(Loulou())
                
                print ("")
                
            default:
                
                print("❌ Choice incorrect - start again ...")
                print("")
            }
        }
        
        printSummary() // Display summary of a team
        
        print("")
        
    } // End of init
    
    //////  Functions
    ////// =========
    
    func printSummary() {           // Display team summary with detail
        
        print("           SUMMARY of your TEAM")
        print(" -------------------------------------------------------------------------------")
        print("🥷🏻 name --- character ----------- weapon ----- damage ----- point(s) of life")
        print(" -------------------------------------------------------------------------------")
        
        for character in aliveCharacters {
            
            print("  ",
                  character.nickName,
                  "       ",
                  character.name,
                  "          ",
                  character.weapon.name,
                  "       ",
                  character.weapon.damage,
                  "         ",
                  character.life)
        }
        print(" ———————————————————————–––––––––——————————————————————————————————————————————")
        
    }
    
    func printTeamAvailable() {     // Display short team summary when it's fighter turn
        
        for index in 0..<aliveCharacters.count {
            print(index+1,": 🥷🏻",aliveCharacters[index].nickName,"having a",aliveCharacters[index].weapon.name,"removing",aliveCharacters[index].weapon.damage,"points of life")
            
        }
    }
    
    func printTeamvictim () {       // Function to display short team summary
        
        for index in 0..<aliveCharacters.count {
            print(index+1,": 🥷🏻",aliveCharacters[index].nickName,"having",aliveCharacters[index].life,"point(s) of life")
            
        }
    }
    
    func characterChoosen(isFighter: Bool) -> Character {  // Return a character
        
        if isFighter {
            printTeamAvailable()
            
        } else {
            printTeamvictim()
        }
        
        if aliveCharacters.count  == 1 {           // no need to choose
            
            print("      ⚠️ Last Character in the team ⚠️")
            print("")
                  
            return aliveCharacters[0]
            
        }
        
        if aliveCharacters.count > 1 {
            
            print("")
            print("⚠️ Enter a number between 1 et \(aliveCharacters.count) please :")
        }
        
        choice = Int(readLine() ?? "-1") ?? -1   // Read the keyboard enter
        
        if choice > 0 && choice <= aliveCharacters.count {
            return aliveCharacters[choice-1]
            
        } else {
            
            print("❌ Invalid choice - Start again")
            print("")
            return characterChoosen(isFighter: isFighter)
        }
    }
    
    
    func displayStatitics () {
        
        print("")
        print("-- name ---- number of shots --------")
        
        for index in 0..<characters.count {
            print(" ",characters[index].nickName,"          ",characters[index].strike)
        }
    }
    
} // End class
