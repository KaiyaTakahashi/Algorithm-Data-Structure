//
//  NumberOfProvinces.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-02.
//

import Foundation


func findCircleNum(_ isConnected: [[Int]]) -> Int {
    var adjList = [[Int]](repeating: [], count: isConnected.count)
    for i in 0..<isConnected.count {
        for j in 0..<isConnected[i].count {
            if i != j  && isConnected[i][j] == 1 {
                adjList[i].append(j + 1)
            }
        }
    }
    var visited = [Bool](repeating: false, count: isConnected.count)
    var count = 0
    while visited.contains(false) {
        let firstFalse = visited.firstIndex(of: false)!
        findCircleNum(adjList: adjList, visited: &visited, next: firstFalse + 1)
        count += 1
    }
    return count
}

func findCircleNum(adjList: [[Int]], visited: inout [Bool], next: Int) {
    if !visited.contains(false) {
        return
    } else {
        visited[next - 1] = true
        for i in adjList[next - 1] {
            if !visited[i - 1] {
                visited[next - 1] = true
                findCircleNum(adjList: adjList, visited: &visited, next: i)
            }
        }
    }
}
