//
//  ConnectedComponents.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-26.
//

import Foundation

func adjacencyListAndDFS2() {
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
    for i in adjList{
        print(i)
    }
    
    // what result would look like
//    []
//    [2, 5]
//    [1, 3, 4, 5]
//    [2, 4]
//    [2, 5, 3, 6]
//    [1, 2, 4]
//    [4]
}

func connectedComponents() {
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

    
    
}
