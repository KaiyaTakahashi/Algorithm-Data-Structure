//
//  Recursion.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-11.
//

import Foundation

func power(base: Int, exponent: Int) -> Int {
    if exponent == 1 {
        return base
    } else {
        return power(base: base, exponent: exponent - 1) * base
    }
}

func palindrome(word: String) -> Bool {
    if word.count <= 1 {
        return true
    }
    if word[0] == word[word.count - 1] {
        return palindrome(word: word[1, word.count - 1])
    }
    return false
}


// Homework
// 3. printBinary(n): prints binary form of given int
func printBinary(_ n: Int) -> String {
    if n == 0 {
        return "0"
    }
    if n == 1 || n == -1 {
        if n == 1 {
            return "1"
        } else {
            return "-1"
        }
    } else {
        let binary = n > 0 ? n % 2: -1 * (n % 2)
        let remainder = n / 2
        return printBinary(remainder) + "\(binary)"
    }
}

// Homework
// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
let contents = try! String(contentsOfFile: "/Users/kaiyatakahashi/Desktop/Swift-AGDS/Swift-AGDS/story.txt")
var sentencesByLine = contents.components(separatedBy: .newlines)

func reverseLines() -> String {
    if sentencesByLine.isEmpty {
        return ""
    } else {
        return sentencesByLine.removeLast() + "\n" + reverseLines()
    }
}

/// 5. evaluate
/// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
/// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
/// - You can use a helper function. (Do not change the original function header)
/// - Use Recursion
/// evaluate("7")                 -> 7
/// evaluate("(2+2)")             -> 4
/// evaluate("(1+(2*4))")         -> 9
/// evaluate("((1+3)+((1+2)*5))") -> 19
func evaluate(_ expr: String) -> Int {
    if !expr.contains("+") && !expr.contains("*") {
        return Int(expr) ?? 0
    } else {
        var leftP: Int = 0
        for i in 0..<expr.count {
            if expr[i] == "(" {
                leftP = i
            }
            if expr[i] == ")" {
                let rightP = i
                let oneOfExpr = createRangedStr(expr, leftP, rightP)
                let answer = calculate(str: oneOfExpr)
                let replacedExpr = expr.replacingOccurrences(of: oneOfExpr, with: answer)
                return evaluate(replacedExpr)
            }
        }
    }
    return evaluate(calculate(str: expr))
}

func calculate(str: String) -> String {
    var withoutParenthesis: String = ""
    if str.contains("(") {
        withoutParenthesis = createRangedStr(str, 1, str.count - 2)
    } else {
        withoutParenthesis = createRangedStr(str, 1, str.count - 2)
    }
    for i in 0..<withoutParenthesis.count {
        if withoutParenthesis[i] == "+" {
            let lnum = Int(createRangedStr(withoutParenthesis, i)) ?? 0
            let rnum = Int(createRangedStr(withoutParenthesis, i + 1, withoutParenthesis.count - 1)) ?? 0
            let sum = lnum + rnum
            return "\(sum)"
        }
        if withoutParenthesis[i] == "*" {
            let lnum = Int(createRangedStr(withoutParenthesis, i)) ?? 0
            let rnum = Int(createRangedStr(withoutParenthesis, i + 1, withoutParenthesis.count - 1)) ?? 0
            let sum = lnum * rnum
            return "\(sum)"
        }
    }
    return ""
}

func createRangedStr(_ str: String, _ start: Int, _ end: Int) -> String {
    let startIndex = str.index(str.startIndex, offsetBy: start)
    let endIndex = str.index(str.startIndex, offsetBy: end)
    let range = startIndex...endIndex
    let string = String(str[range])
    return string
}

func createRangedStr(_ str: String, _ end: Int) -> String {
    let endIndex = str.index(str.startIndex, offsetBy: end)
    let string = String(str[..<endIndex])
    return string
}
