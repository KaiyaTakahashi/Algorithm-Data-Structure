//
//  DijkstraAlgorithm.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-22.
//

import Foundation

func dijkstra(adjList: [[Int]]) {
    var shortestD = [Int](repeating: 9223372036854775807, count: adjList.count)
    var prevV = [Int](repeating: 0, count: adjList.count)
    var visited = [Bool](repeating: false, count: adjList.count)
    shortestD[0] = 0
    var unvisitedShortestD: [Int] = shortestD
    print(adjList)
    for _ in 0..<adjList.count  {
        let min = unvisitedShortestD.min()!

        let index = unvisitedShortestD.firstIndex(of: min)!
        visited[index] = true
        unvisitedShortestD[index] = 9223372036854775807
        for i in stride(from: 0, to: adjList[index].count - 1, by: 2) {
            prevV[adjList[index][i]] = index
            print("previous: \(prevV[adjList[index][i]]), edgeDistance: \(adjList[index][i + 1]), result=>: \(adjList[index][i + 1] + shortestD[prevV[adjList[index][i]]])")
            if visited[adjList[index][i]] == false && shortestD[i] > adjList[index][i + 1] + shortestD[prevV[adjList[index][i]]] {
                
                shortestD[adjList[index][i]] = adjList[index][i + 1] + shortestD[prevV[adjList[index][i]]]
                unvisitedShortestD[adjList[index][i]] = adjList[index][i + 1] + shortestD[prevV[adjList[index][i]]]
            }
        }
        print("visited: \(visited)")
        print("this is shortD: \(shortestD)")
    }
    print(shortestD)

}
