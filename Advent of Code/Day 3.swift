//
//  Day 3.swift
//  Advent of Code
//
//  Created by Luca Morara on 03/12/20.
//

import Foundation

//MARK: - Part ONE & TWO

func numberOfTrees(movements: (right: Int, down: Int)) -> Int {
    var numOfTrees = 0
    let numOfRows = input_day_3.count
    var movementsMade = movements
    
    while movementsMade.down < numOfRows {
        if isTree(position: (movementsMade.right, movementsMade.down)) {
            numOfTrees += 1
        }
        
        movementsMade.down += movements.down
        movementsMade.right += movements.right
    }
    
    return numOfTrees
}

//MARK: - Other methods

//Returns TRUE if, in the given coordinates, there's a tree
fileprivate func isTree(position: (x: Int, y: Int)) -> Bool {
    let row = input_day_3[position.y]
    let tree = characterAtIndex(string: row, index: position.x % row.count)
    
    return tree == "#" ? true : false
}

fileprivate func characterAtIndex(string: String, index: Int) -> String {
    return String(string[string.index(string.startIndex, offsetBy: index)])
}
