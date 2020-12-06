//
//  Day 4.swift
//  Advent of Code
//
//  Created by Luca Morara on 04/12/20.
//

import Foundation

fileprivate let partOne = true

//MARK: - Part ONE

func countValidPassports() -> Int {
    input_day_4 = input_day_4.replacingOccurrences(of: "\r", with: "")
    let passportList = input_day_4.components(separatedBy: "\n\n")
    
    var number = 0
    
    for passport in passportList {
        if checkValidPassport(dataString: passport) {
            number += 1
        }
    }
    
    return number
}

//MARK: - Other methods

fileprivate func checkValidPassport(dataString: String) -> Bool {
    let tempDataString = dataString.replacingOccurrences(of: "\n", with: " ")
    let arrayDataString = tempDataString.components(separatedBy: " ")
    let dicData = divideField(arrayDataString: arrayDataString)
    
    if dicData.count == 8 {
        if partOne {
            return true
        } else {
            return validateData(data: dicData)
        }
    } else if dicData.count == 7 && dicData["cid"] == nil {
        if partOne {
            return true
        } else {
            return validateData(data: dicData)
        }
    } else {
        return false
    }
}

fileprivate func divideField(arrayDataString: [String]) -> [String: String] {
    var dicTemp = [String: String]()
    
    for field in arrayDataString {
        let keyValuePairs = field.components(separatedBy: ":")
        dicTemp[keyValuePairs[0]] = keyValuePairs[1]
    }
    
    return dicTemp
}

fileprivate func validateData(data: [String: String]) -> Bool {
    if !validateBYR_IYR_EYR(data["byr"]!, range: 1920...2002) {
        return false
    }
    
    if !validateBYR_IYR_EYR(data["iyr"]!, range: 2010...2020) {
        return false
    }
    
    if !validateBYR_IYR_EYR(data["eyr"]!, range: 2020...2030) {
        return false
    }
    
    if !validateHGT(data["hgt"]!) {
        return false
    }
    
    if !validateHCL(data["hcl"]!) {
        return false
    }
    
    if !validateECL(data["ecl"]!) {
        return false
    }
    
    if !validatePID(data["pid"]!) {
        return false
    }
    
    return true
}

fileprivate func validateBYR_IYR_EYR(_ string: String, range: ClosedRange<Int>) -> Bool {
    guard let year = Int(string) else { return false }
    
    return range.contains(year) ? true : false
}

fileprivate func validateHGT(_ string: String) -> Bool {
    if !string.contains("cm") && !string.contains("in") { return false }
    guard let value = Int(string.dropLast(2)) else { return false }
    
    if string.contains("cm") {
        return (150...193).contains(value) ? true : false
    }
    
    if string.contains("in") {
        return (59...76).contains(value) ? true : false
    }
    
    return false
}

fileprivate func validateHCL(_ string: String) -> Bool {
    if !string.contains("#") {
        return false
    }
    
    if string.count != 7 {
        return false
    }
    
    for c in string.dropFirst() {
        if !c.isHexDigit {
            return false
        }
    }
    
    return true
}

fileprivate func validateECL(_ string: String) -> Bool {
    return "amb blu brn gry grn hzl oth".contains(string) ? true : false
}

fileprivate func validatePID(_ string: String) -> Bool {
    guard let _ = Int(string) else { return false }
    
    return string.count == 9 ? true : false
}
