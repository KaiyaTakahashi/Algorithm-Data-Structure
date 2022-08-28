//
//  patternMatch.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-26.
//

import Foundation

func patternMatch() {
    let n = Int(String(readLine()!))!
    var arr = [String]()
    for i in 0..<n {
        arr.append(String(readLine()!))
    }
    let pattern = String(readLine()!)
    
    var splittedArr = [[String]](repeating: [], count: n)
    for i in 0..<arr.count {
        var str = arr[i]
        var i = 0
        while i != str.count {
            
        }
    }

    var ans = [Bool](repeating: false, count: n)
    for i in 0..<arr.count {
        var tempPattern = pattern
        for j in 0..<arr[i].count {
 
        }
    }
}
