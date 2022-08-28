//
//  PathWithMaximumProbability.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-24.
//

import Foundation

func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
    var adjList = [[(Int, Double)]](repeating: [], count: n)
    for (i, edge) in edges.enumerated() {
        adjList[edge[0]].append((edge[1], succProb[i]))
        adjList[edge[1]].append((edge[0], succProb[i]))
    }

    var maxProb = [Double](repeating: 0, count: n)
    var visited = [Bool](repeating: false, count: n)
    var queue = Queue<Int>()
    visited[start] = true
    maxProb[start] = 1
    queue.enqueue(item: start)
    while !queue.isEmpty() {
        let ver = queue.dequeue()!
        visited[ver] = false
        for edge in adjList[ver] {
            if maxProb[edge.0] < maxProb[ver] * edge.1 {
                maxProb[edge.0] = maxProb[ver] * edge.1
                if !visited[edge.0] {
                    queue.enqueue(item: edge.0)
                    visited[edge.0] = true
                }
            }
        }
    }
    
    return maxProb[end]
}
