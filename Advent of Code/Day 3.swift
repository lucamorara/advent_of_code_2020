//
//  Day 3.swift
//  Advent of Code
//
//  Created by Luca Morara on 03/12/20.
//

import Foundation

//MARK: - Part ONE

func numberOfTrees(movements: (right: Int, down: Int)) -> Int {
    var numOfTrees = 0
    let numOfRows = input_day_3.count
    var movementsMade = movements
    
    while movementsMade.down < numOfRows {
        if isTree(movements: (movementsMade.right, movementsMade.down)) {
            numOfTrees += 1
        }
        
        movementsMade.down += movements.down
        movementsMade.right += movements.right
    }
    
    return numOfTrees
}

//MARK: - Other methods
fileprivate func isTree(movements: (right: Int, down: Int)) -> Bool {
    let row = input_day_3[movements.down]
    let tree = characterAtIndex(string: row, index: movements.right % row.count)
    
    return tree == "#" ? true : false
}

fileprivate func characterAtIndex(string: String, index: Int) -> String {
    return String(string[string.index(string.startIndex, offsetBy: index)])
}
