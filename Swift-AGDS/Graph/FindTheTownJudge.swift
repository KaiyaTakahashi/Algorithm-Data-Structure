//
//  FindTheTownJudge.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-02.
//

import Foundation

var sus = Set<Int>()
func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    var adjList = [[Int]](repeating: [], count: n)
    for i in trust {
        adjList[i[0] - 1].append(i[1])
    }

    for i in 0..<adjList.count {
        if adjList[i].isEmpty {
            sus.insert(i + 1)
        }
    }

    if sus.count == 1 {
        let susNum = sus.popFirst()!
        var index = 0
        while index != adjList.count - 1 {
            if susNum != index + 1 {
                if !adjList[index].contains(susNum) {
                    return -1
                }
            }
            index += 1
        }
        return susNum
    } else {
        return -1
    }
}
