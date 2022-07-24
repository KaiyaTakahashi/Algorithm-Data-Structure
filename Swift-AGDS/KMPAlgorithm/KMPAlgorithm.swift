//
//  KMPAlgorithm.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-20.
//

import Foundation

func kmp(str: String, pattern: String) -> Int {
    if pattern == "" { return 0 }
    
    // Create LPS array
    // O(m)
    var lps = [Int]()
    var prevLps = 0
    var i = 1
    while i < pattern.count {
        if pattern[i] == pattern[prevLps] {
            lps.append(prevLps + 1)
            prevLps += 1
            i += 1
        } else {
            if prevLps == 0 {
                lps.append(0)
                i += 1
            } else {
                prevLps = lps[prevLps - 1]
            }
        }
    }

    // Start looking for the pattern
    // O(n + m)
    var strIndex = 0
    var patternIndex = 0
    while patternIndex < str.count {
        if str[strIndex] == pattern[patternIndex] {
            strIndex += 1
            patternIndex += 1
        } else {
            if patternIndex == 0 {
                strIndex += 1
            } else {
                patternIndex = lps[patternIndex - 1]
            }
        }
        if patternIndex == pattern.count {
            return strIndex - pattern.count
        }
    }
    return -1
}
