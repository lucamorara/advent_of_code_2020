//
//  Day 5.swift
//  Advent of Code
//
//  Created by Luca Morara on 05/12/20.
//

import Foundation

//MARK: - Part ONE

func checkHighestID() -> Int {
    var list = [Int]()
    
    for code in input_day_5 {
        let seatID = decodeSeat(code: code)
        list.append(seatID)
    }
    
    //MARK: - Part TWO
    for x in 84...901 {
        if !list.contains(x) {
            print(x)
        }
    }
    //END part TWO
    
    return list.sorted().last ?? -1
}

func decodeSeat(code: String) -> Int {
    let row = String(code.prefix(7))
    let column = String(code.suffix(3))
    
    let rowID = decodeRow(code: row)
    let columnID = decodeColumn(code: column)
    
    return rowID * 8 + columnID
}

fileprivate func decodeRow(code: String) -> Int {
    var min = 0.0
    var max = 127.0
    
    for c in code {
        if c == "F" {
            max = ((min + max) / 2).rounded(.down)
        } else {
            min = ((min + max) / 2).rounded(.up)
        }
    }
    
    return code.last! == "F" ? Int(min) : Int(max)
}

fileprivate func decodeColumn(code: String) -> Int {
    var min = 0.0
    var max = 7.0
    
    for c in code {
        if c == "L" {
            max = ((min + max) / 2).rounded(.down)
        } else {
            min = ((min + max) / 2).rounded(.up)
        }
    }
    
    return code.last! == "L" ? Int(min) : Int(max)
}
