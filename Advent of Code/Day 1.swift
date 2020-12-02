//
//  Day 1.swift
//  Advent of Code
//
//  Created by Luca Morara on 02/12/20.
//

import Foundation

// MARK: - Part ONE
func findTwoNumbers() -> Int? {
    var product = 1
    
    for n in input_day_1 {
        if input_day_1.contains(2020 - n) {
            product *= n
        }
    }
    
    return product == 1 ? nil : product
}

// MARK: - Part TWO
func findThreeNumbers() -> Int? {
    for x in input_day_1 {
        for y in input_day_1 {
            if input_day_1.contains(2020 - x - y) {
                let z = input_day_1.first(where: { $0 == (2020 - x - y) })!
                
                return x * y * z
            }
        }
    }
    
    return nil
}
