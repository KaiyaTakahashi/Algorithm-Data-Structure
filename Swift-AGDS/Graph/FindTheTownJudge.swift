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

//Input: n = 2, trust = [[1,2]]
//Output: 2

//Input: n = 3, trust = [[1,3],[2,3]]
//Output: 3

//Input: n = 3, trust = [[1,3],[2,3],[3,1]]
//Output: -1

//4, [[1,3],[1,4],[2,3],[2,4],[4,3]]
//3
