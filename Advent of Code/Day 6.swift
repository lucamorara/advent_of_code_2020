//
//  Day 6.swift
//  Advent of Code
//
//  Created by Luca Morara on 06/12/20.
//

import Foundation

//MARK: - Part ONE

func sumCounts() -> Int {
    input_day_6 = input_day_6.replacingOccurrences(of: "\r", with: "")
    let answersList = input_day_6.components(separatedBy: "\n\n")
    var sum = 0
    
    answersList.forEach {
        sum += countIndividualCharcaters(string: $0)
    }
    
    return sum
}

//MARK: - Part TWO

func sumCountsIndividuals() -> Int {
    input_day_6 = input_day_6.replacingOccurrences(of: "\r", with: "")
    let answersList = input_day_6.components(separatedBy: "\n\n")
    var sum = 0
    
    answersList.forEach {
        sum += countCommonCharacters(string: $0)
    }
    
    return sum
}

//MARK: - Other methods

fileprivate func countIndividualCharcaters(string: String) -> Int {
    let tempString = string.replacingOccurrences(of: "\n", with: "")
    
    return Set(Array(tempString)).count
}

fileprivate func countCommonCharacters(string: String) -> Int {
    let arrayString = string.components(separatedBy: "\n")
    var sum = 0
    
    for character in arrayString[0] {
        if countRepetition(of: character, in: arrayString) == arrayString.count {
            sum += 1
        }
    }
    
    return sum
}

fileprivate func countRepetition(of character: Character, in strings: [String]) -> Int {
    let tempString = strings.reduce("", +)
    return tempString.filter({ $0 == character }).count
}
