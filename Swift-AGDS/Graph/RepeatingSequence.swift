//
//  RepeatingSequence.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-27.
//

import Foundation

func repeatingSequence() -> Int {
    let input = readLine()!.split(separator: " ")
    var num = Int(String(input[0]))!
    let expo = Int(String(input[1]))!
    var arr = [Int]()
    return repeatingSequence(num: &num, expo: expo, arr: &arr)
}

func repeatingSequence(num: inout Int, expo: Int, arr: inout [Int]) -> Int {
    var first = 0
    var last = 0
    if arr.count > 1 {
        first = arr.firstIndex(of: num)!
        last = arr.lastIndex(of: num)!
    }
    if arr.count > 1 && first != last {
        print(arr)
        return arr.firstIndex(of: num)! + 1
    } else {
        var sum = 0
        while num != 0 {
            let firstDigit = num % 10
            sum += power(base: firstDigit, exponent: expo)
            num /= 10
        }
        arr.append(sum)
        return repeatingSequence(num: &sum, expo: expo, arr: &arr)
    }
}
