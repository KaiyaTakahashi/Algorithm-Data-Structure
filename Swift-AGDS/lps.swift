//
//  lps.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-26.
//

import Foundation

func lps(str: String) -> Int {
    var longest = 0
    for i in 0..<str.count {
        var left = i
        var right = i
        
        while left >= 0 && right <= str.count - 1 && str[left] == str[right] {
            if right - left + 1 > longest {
                longest = right - left + 1
            }
            left -= 1
            right += 1
        }
        
        left = i
        right = i + 1
        while left >= 0 && right <= str.count - 1 && str[left] == str[right] {
            if right - left + 1 > longest {
                longest = right - left + 1
            }
            left -= 1
            right += 1
        }
    }
    return longest
    
}
