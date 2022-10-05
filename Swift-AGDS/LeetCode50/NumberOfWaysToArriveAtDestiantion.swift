//
//  NumberOfWaysToArriveAtDestiantion.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-10-02.
//

import Foundation

//struct Node: Comparable, Hashable {
//    static func < (lhs: Node, rhs: Node) -> Bool {
//        return lhs.disFrom0 < rhs.disFrom0
//    }
//
//    let disFrom0: Int
//    let index: Int
//}
//
//func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
//    var adjList = [[(to: Int, distance: Int)]](repeating: [], count: n)
//    for road in roads {
//        adjList[road[0]].append((road[1], road[2]))
//        adjList[road[1]].append((road[0], road[2]))
//    }
//
//    var visited = [Bool](repeating: false, count: n)
//    var table = [Int](repeating: Int.max, count: n)
//    table[0] = 0
//    var pathsNum = [Int](repeating: 0, count: n)
//    pathsNum[0] = 1
//
//    var pq = IndexPriorityQueue<Node>(<)
//
//    pq.enqueue(Node(disFrom0: 0, index: 0))
//
//    while !pq.isEmpty {
//        let node = pq.dequeue()!
//        print("poped: \(node.index)")
//        visited[node.index] = true
//        for edge in adjList[node.index] {
//            if visited[edge.to] == false {
//                if table[node.index] + edge.distance < table[edge.to] {
//                    table[edge.to] = table[node.index] + edge.distance
//                    let num = pathsNum[node.index] % 1000000007
//                    pathsNum[edge.to] = num
//                    print("enqueued: \(edge.to)")
//                    pq.enqueue(Node(disFrom0: table[node.index] + edge.distance, index: edge.to))
//                } else if table[node.index] + edge.distance == table[edge.to] {
//                    pathsNum[edge.to] += pathsNum[node.index]
//                    pathsNum[edge.to] %= 1000000007
//                }
//            }
//        }
//        print(pathsNum)
//
//    }
//    print(pathsNum)
//    return pathsNum[n - 1]
//}

struct Edge: Comparable, Hashable {
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.w < rhs.w
    }

    let s: Int
    let v: Int
    let w: Int

}

func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
    var adjList = [[(to: Int, distance: Int)]](repeating: [], count: n)
    for road in roads {
        adjList[road[0]].append((road[1], road[2]))
        adjList[road[1]].append((road[0], road[2]))
    }

    var visited = [Bool](repeating: false, count: n)
    var table = [Int](repeating: Int.max, count: n)
    table[0] = 0
    var pathsNum = [Int](repeating: 0, count: n)
    pathsNum[0] = 1

    var pq = IndexPriorityQueue<Edge>(<)

    for edge in adjList[0] {
        pq.enqueue(Edge(s: 0, v: edge.to, w: edge.distance))
    }


    while let edge = pq.dequeue() {
       if edge.w < table[edge.v] {
         table[edge.v] = edge.w
           let num = pathsNum[edge.s] % 1000000007
           pathsNum[edge.v] = num
         for e in adjList[edge.v] {
             pq.enqueue(Edge(s: edge.v, v: e.to, w: e.distance + edge.w))
         }
       } else if edge.w == table[edge.v] {
           pathsNum[edge.v] += pathsNum[edge.s]
           pathsNum[edge.v] %= 1000000007
       }
     }
    return pathsNum[n - 1]
}
