//
//  Game.swift
//  P3_Donald's nephews battle
//
//  Created by Stéphane KERHOAS on 17/11/2021.
//

import Foundation

class Game {
    
    var team1: Team
    var team2: Team
    static var gameIsFinish = false     // Static variable to control the exit
    
    
    init(){         //Game's constructor
        
        print("-----------------------------------")
        print("Player#1: WELCOME! build your team")
        print("-----------------------------------")
        print("")
        
        team1 = Team()  // Team Instantiation
        
        print("")
        next()
        
        print("-----------------------------------")
        print("Player#2: WELCOME! build your team")
        print("-----------------------------------")
        
        team2 = Team()  // Team Instantiation
        
        print("")
        next()
        
    } // End of init
    
    ////// Functions  ///////////////////////////////////////////
    
    func start() {          // Start the game
        
        print("\n\n\n");
        print("🌟✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨🌟")
        print("The battle between Player#1 and Player#2 is now engaged - let's play !".uppercased())
        print("🌟✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨🌟")
        print("\n\n")
        
        team1.teamNumber = 1 // Player number needed to custom some print message
        team2.teamNumber = 2 //
        
        repeat {
            
            playWithChest(fighter: team1, victim: team2)    //Team#1 turn
            if Game.gameIsFinish  {    // Force exit of the loop
                break
            }
            next()
            
            playWithChest(fighter: team2, victim: team1)     //Team#2 turn
            if Game.gameIsFinish  {    // Force exit of the loop
                break
            }
            next()
            
        } while !Game.gameIsFinish
        
        if team1.aliveCharacters.count == 0 {
            statistics (winner:team2,looser:team1)
            
        }else {
            statistics (winner:team1,looser:team2)
            
        }
        
        print("\n\n\n\n")
        print("     ------------")
        print(" --- GAME is OVER ---")
        print("     ------------")
        print("\n\n\n\n")
        
    }
    
    ////// Functions ///
    
    func chestLogic(on choice: Character) -> Bool {                 // Chest process
        
        let chestState = Bool.random()                             // True -> Chest can be opened
        
        if chestState {                                           // We have a key to open the chest !
            
            print ("✨🌟✨ Uncle Donald has found a key !")
            print(choice.nickName,", would you like to open Uncle Picsou's chest with that key ? there is a surprise 👻 [Y/n]", terminator: " : " )
            
            if readLine() == "n" {
                print("😟 you have decided not to open the chest ...")
                
            } else {
                
                chestIntro ()       // Display Opening message - (be patient for 2 seconds ;-))
                let ownAweapon = Bool.random() // Do we have an extra weapon ?
                
                if ownAweapon {
                    choice.weapon.damage = Int.random(in: 5...70)
                    choice.weapon.name = "extra Weapon"
                    
                    print(choice.nickName, "You grabbed an \"E X T R A\" weapon removing",choice.weapon.damage,"points of life")
                    
                } else {
                    print("🏥 We have enough to heal, cool ! ")   // Else we have a heal :-)
                    print("")
                    
                    return false
                }
            }
        }
        
        return true
    }
    
    
    func playWithChest (fighter: Team,victim: Team) {      // Fight between both the teams, a fighter and a victim
        
        print("")
        print("Player#\(fighter.teamNumber) -> Choose your fighter :")
        print("-————————————————————————————————")
        print("")
        
        let choice = fighter.characterChoosen(isFighter: true)
        
        fighter.counter += 1                                             // Increment the Team strike counter
        choice.strike += 1                                               // Increment the shots counter for the choosen character
        
        let ownAweapon = chestLogic(on: choice)
        
        if !ownAweapon {      //We  have a heal
            let remedy = Int.random(in: 5...30)
            
            print("This heal will add",remedy,"more life points")
            print("")
            print("💡 You can also heal yourself ...")
            print("")
            print(choice.nickName," -> Choose a member of your team to heal :")
            print("——————————————————————————————————————————")
            print("")
            
            let patientChoosen = fighter.characterChoosen(isFighter: false) // display short team summar
            
            print(patientChoosen.nickName,"-> Old points of life :",patientChoosen.life)
            
            patientChoosen.life = patientChoosen.life + remedy        // Give the heal to the patient
            
            print("New points of life :",patientChoosen.life)
            print("");print("")
            
        } else {              // We have a weapon
            
            print("")
            print(choice.nickName," -> Choose your victim :")
            print("-——————————————————————————————")
            print("")
            
            // Display members available for Team with point(s) of life detail, then ask to choice a victim
            let victimChoice = victim.characterChoosen(isFighter: false)
            
            // Compute remaing life of the victim
            victimChoice.life -= choice.weapon.damage
            
            // Display victim remaining life summary
            print("")
            print("#####--")
            print("Remaining points of life for",victimChoice.nickName,":",victimChoice.life)
            print("#####--")
            print("")
            
            if victimChoice.life <= 0 {  // we have killed a victim
                
                print("🤡",choice.nickName,"you have won the fight against",victimChoice.nickName,"!")
                print("💀",victimChoice.nickName,"has no more points of life 😂")
                print("")
                
            }
        }
        
        if victim.aliveCharacters.count == 0 {  // We can leave the game
            
            Game.gameIsFinish = true
            
        }
    }
    
    
    func statistics (winner: Team, looser: Team){
        
        clearScreen()
        
        print(title)
        print("");print("");print("")
        print("---------------------------")
        print("🏆 TEAM#\(winner.teamNumber) is the WINNER 🏆")
        print("---------------------------")
        print("")
        
        print(" === STATISTICS ===")
        print("◉ Number of shots:",winner.counter)
        print("◉ remaining members for TEAM#\(winner.teamNumber):",winner.aliveCharacters.count)
        print("")
        
        winner.printSummary()
        winner.displayStatitics()
        
        print("")
        print("TEAM#\(looser.teamNumber), All members are dead ...")
        print("◉ Number of shots:",looser.counter)
        
        looser.displayStatitics()
        
    }
}

////// Functions for facilities  ///////////////////////////////////////////

func chestIntro () { // Delayed message, be patient !
    
    print("")
    print("🎁 Opening the Chest and catching your surpise  ",terminator: "")
    for _ in 0...2 {
        print("", terminator: "◉")
        usleep(500000)
    }
    
    print("")
    
}

func next (){          // continue - next page
    
    print("⚠️ Press ENTER, please ! ", terminator: "" )
    _ = readLine()
    clearScreen()
    
    print(title)
    print("\n\n")
    
}





