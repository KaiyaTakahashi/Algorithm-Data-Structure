//
//  BackTracking.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-13.
//

import Foundation

func rollDiceSum(_ n: Int, _ sum: Int) {
    var choices = [Int]()
    rollDiceHelpler(n, choices: &choices)
}

func rollDiceSumHelper(_ n: Int, _ sum: Int, choices: inout [Int]) {
    if n == 0 {
        if sum == 0 {
            print(choices)
        }
    } else {
        for i in 1...6 {
            choices.append(i)
            rollDiceSumHelper(n - 1, sum - i, choices: &choices)
            choices.removeLast()
        }
    }
}
