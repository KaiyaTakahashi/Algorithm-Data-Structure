//
//  NetworkDelayTime.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-23.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    struct Node {
        let num: Int
        let weight: Int
    }
    var adjList = [[Node]](repeating: [], count: n)
    for i in 0..<times.count {
        adjList[times[i][0] - 1].append(Node(num: times[i][1], weight: times[i][2]))
    }
    
    if adjList[k - 1].isEmpty {
        return -1
    }
    
    var shortestD = [Int](repeating: 2147483648, count: n)
    shortestD[k - 1] = 0
    var visited = Set<Int>()
    while visited.count < n {
        var min =  2147483648
        var minIndex = -1
        for i in 0..<shortestD.count {
            if !visited.contains(i) && min > shortestD[i] {
                min = shortestD[i]
                minIndex = i
            }
        }
        visited.insert(minIndex)
        if minIndex == -1 {
            return -1
        }
        for i in 0..<adjList[minIndex].count {
            if shortestD[adjList[minIndex][i].num - 1] > shortestD[minIndex] + adjList[minIndex][i].weight {
                shortestD[adjList[minIndex][i].num - 1] = shortestD[minIndex] + adjList[minIndex][i].weight
            }
        }
    }
    return shortestD.max()!
}
