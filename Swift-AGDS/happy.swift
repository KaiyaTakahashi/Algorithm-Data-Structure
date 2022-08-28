//
//  happy.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-26.
//

import Foundation

func happy(str: String) -> String {
    var i = 0
    var happy = 0
    var sad = 0
    while i < str.count {
        if str[i] == ":" {
            if i + 2 <= str.count && str[i + 1] == "-" && str[i + 2] == ")" {
                happy += 1
                i += 3
            } else if i + 2 <= str.count && str[i + 1] == "-" && str[i + 2] == "(" {
                sad += 1
                i += 3
            }
        }
        i += 1
    }

    if happy > sad {
        return "happy"
    } else if happy < sad {
        return "sad"
    } else {
        return "none"
    }
}
