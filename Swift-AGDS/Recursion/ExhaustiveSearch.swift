//
//  ExhaustiveSearch.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-13.
//

import Foundation

// Print all binary bumber representation with n digit
func printBinaryExhaustive(_ n: Int) {
    printBinaryExhaustive(n, soFar: "", padding: "")
}

func printBinaryExhaustive(_ n: Int, soFar: String, padding: String) {
    print("\(padding) int: \(n), soFar: \(soFar)")
    if n == 0 {
        //print(soFar)
    } else {
        for i in 0...1 {
            printBinaryExhaustive(n - 1, soFar: soFar + "\(i)", padding: padding + "  ")
        }
    }
}

func printDecimal(_ n: Int) {
    printDecimal(n, "")
}

func printDecimal(_ n: Int, _ soFar: String) {
    if n == 0 {
        print(soFar)
    } else {
        for i in 0...9 {
            printDecimal(n - 1, soFar + "\(i)")
        }
    }
}

func permutation(_ word: String) {
    permutation(word, soFar: "")
}

func permutation(_ word: String, soFar: String) {
    if word.count == 0 {
        print(soFar)
    } else {
        for i in 0..<word.count {
            let c = word[i]
            permutation(word[0, i] + word[i + 1, word.count], soFar: soFar + "\(c)")
        }
    }
}

func uniquePermutation(_ word: String) {
    uniquePermutation(word, soFar: "")
}

func uniquePermutation(_ word: String, soFar: String) {
    if word.count == 0 {
        print(soFar)
    } else {
        for i in 0..<word.count {
            let c = word[i]
            uniquePermutation(word[0, i] + word[i + 1, word.count], soFar: soFar + "\(c)")
        }
    }
}

func rollDice(_ n: Int) {
    var choices = [Int]()
    rollDiceHelpler(n, choices: &choices)
}

func rollDiceHelpler(_ n: Int, choices: inout [Int]) {
    if n == 0 {
        print(choices)
    } else {
        for i in 1...6 {
            choices.append(i)
            rollDiceHelpler(n - 1, choices: &choices)
            choices.removeLast()
        }
    }
}
