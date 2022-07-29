//
//  IsBipartite.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-26.
//

import Foundation

func createAdjacentList() -> [[Int]] {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let n = Int(firstLine[0])!
    // # of edges
    let m = Int(firstLine[1])!
    
    // adjacency list
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
      let edge = readLine()!.split(separator: " ")
      let u = Int(edge[0])!
      let v = Int(edge[1])!
      adjList[u].append(v)
      adjList[v].append(u) // undirected graph
    }
    return adjList
}

func isBipartite(adjacentList: [[Int]], separatedArr: inout [[Int]], separatedIndex: inout Int, nextNum: Int) {
    if separatedArr[separatedIndex].contains(nextNum) || adjacentList[nextNum].isEmpty {
        return
    } else {
        print(separatedArr)
        if separatedIndex == 1 {
            if separatedArr[0].contains(nextNum) {
                
            }
        }
        separatedArr[separatedIndex].append(nextNum)
        if separatedIndex == 1 {
            separatedIndex = 0
        } else {
            separatedIndex = 1
        }
        for i in adjacentList[nextNum] {
            isBipartite(adjacentList: adjacentList, separatedArr: &separatedArr, separatedIndex: &separatedIndex, nextNum: i)
        }
    }
}
