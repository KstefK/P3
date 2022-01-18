//
//  main.swift
//  P3_Donald's nephews battle
//
//  Created by Stéphane KERHOAS on 17/11/2021.
//

import Foundation

var title = """
        _
       | \\  _  ._   _. |  _| / _   ._   _  ._  |_   _        _
       |_/ (_) | | (_| | (_|  _>   | | (/_ |_) | | (/_ \\/\\/ _>
                                           |
                        |_   _. _|_ _|_ |  _
                        |_) (_|  |_  |_ | (/_
    """

clearScreen ()

print(title)
print("\n\n")

print("------------")
print("Let's play !")
print("------------")
print("")

var myGame = Game()  // Game Instantiation
myGame.start() // Start the game

////// Function

func clearScreen () {       // make the user interface more amazing ...
    
    print("", terminator: Array(repeating: "\n", count: 50).joined())
    
}





