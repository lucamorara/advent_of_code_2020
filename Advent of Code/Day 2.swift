//
//  Day 2.swift
//  Advent of Code
//
//  Created by Luca Morara on 02/12/20.
//

import Foundation

//MARK: - Part ONE
func numberOfRightPasswords() -> Int {
    var num = 0
    
    for x in input_day_2 {
        let components = x.split(separator: " ")
        let minMax = returnMinMax(String(components[0]))
        let character = String(components[1].first!)
        let string = String(components[2])
        let numOfCharacters = numberOfCharacters(character: character, in: string)
        
        if numOfCharacters >= minMax.0 && numOfCharacters <= minMax.1 {
            num += 1
        }
    }
    
    return num
}

//MARK: - Part TWO
func numberOfRightPasswords_2() -> Int {
    var num = 0
    
    for x in input_day_2 {
        let components = x.split(separator: " ")
        let minMax = returnMinMax(String(components[0]))
        let character = String(components[1].first!)
        let string = String(components[2])
        
        var isRightPassword = false
        
        if characterPosition(character: character, position: minMax.0, string: string) {
            isRightPassword.toggle()
        }
        
        if characterPosition(character: character, position: minMax.1, string: string) {
            isRightPassword.toggle()
        }
        
        if isRightPassword {
            num += 1
        }
    }
    
    return num
}

//MARK: - Other methods
fileprivate func returnMinMax(_ text: String) -> (Int, Int) {
    let minMax = text.split(separator: "-")
    
    return (Int(minMax[0])!, Int(minMax[1])!)
}

fileprivate func numberOfCharacters(character: String, in string: String) -> Int {
    return string.map { String($0) }.filter({ $0 == character }).count
}

fileprivate func characterPosition(character: String, position: Int, string: String) -> Bool {
    let characterIndex = string.index(string.startIndex, offsetBy: position - 1)
    let stringCharacter = string[characterIndex]
    
    return String(stringCharacter) == character
}
