//
//  PathWithMaximumProbability.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-24.
//

import Foundation

//func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
//    struct Node {
//        let to: Int
//        let succProb: Double
//    }
//    var adj = [[Node]](repeating: [], count: n)
//    for i in 0..<edges.count {
//        adj[edges[i][0]].append(Node(to: edges[i][1], succProb: succProb[i]))
//        adj[edges[i][1]].append(Node(to: edges[i][0], succProb: succProb[i]))
//    }
//    if adj[start].isEmpty {
//        return 0
//    }
////    for i in 0..<adj.count {
////        for j in 0..<adj[i].count {
////            print("Node: to\(adj[i][j].to), prob:\(adj[i][j].succProb)")
////        }
////        print()
////    }
//    var maxProb = [Double](repeating: -9223372036854775807, count: n)
//    var visited = Set<Int>()
//    maxProb[start] = 1
//    var count = 0
//    while visited.count != n || count > n {
//        var maxIndex = -1
//        var max: Double = -9223372036854775807
//        for i in 0..<maxProb.count where !visited.contains(i) {
//            if maxProb[i] > max {
//                max = maxProb[i]
//                maxIndex = i
//            }
//        }
//        visited.insert(maxIndex)
//        print("visited:\(visited)")
//        print("maxIndex: \(maxIndex)")
//        if maxIndex == -1 {
//            if maxProb[end] == -9223372036854775807 {
//                return 0
//            } else {
//                return maxProb[end]
//            }
//        }
//        for i in 0..<adj[maxIndex].count where !visited.contains(adj[maxIndex][i].to) {
//            if maxProb[adj[maxIndex][i].to] < maxProb[maxIndex] * adj[maxIndex][i].succProb {
//                maxProb[adj[maxIndex][i].to] = maxProb[maxIndex] * adj[maxIndex][i].succProb
//            }
//        }
//        count += 1
//        print(maxProb)
//    }
//    var ans = maxProb[end]
//    if ans == -9223372036854775807 {
//        ans = 0
//    }
//    return ans
//}

func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
    struct Node {
        let to: Int
        let succProb: Double
    }
    var adj = [[Node]](repeating: [], count: n)
    for i in 0..<edges.count {
        adj[edges[i][0]].append(Node(to: edges[i][1], succProb: succProb[i]))
        adj[edges[i][1]].append(Node(to: edges[i][0], succProb: succProb[i]))
    }
    if adj[start].isEmpty {
        return 0
    }
//    for i in 0..<adj.count {
//        for j in 0..<adj[i].count {
//            print("Node: to\(adj[i][j].to), prob:\(adj[i][j].succProb)")
//        }
//        print()
//    }
    var maxProb = [Double](repeating: -9223372036854775807, count: n)
    var visited = Set<Int>()
    maxProb[start] = 1
    var count = 0
    while visited.count != n || count > n {
        var maxIndex = -1
        var max: Double = -9223372036854775807
        for i in 0..<maxProb.count where !visited.contains(i) {
            if maxProb[i] > max {
                max = maxProb[i]
                maxIndex = i
            }
        }
        visited.insert(maxIndex)
        print("visited:\(visited)")
        print("maxIndex: \(maxIndex)")
        if maxIndex == -1 {
            if maxProb[end] == -9223372036854775807 {
                return 0
            } else {
                return maxProb[end]
            }
        }
        for i in 0..<adj[maxIndex].count where !visited.contains(adj[maxIndex][i].to) {
            if maxProb[adj[maxIndex][i].to] < maxProb[maxIndex] * adj[maxIndex][i].succProb {
                maxProb[adj[maxIndex][i].to] = maxProb[maxIndex] * adj[maxIndex][i].succProb
            }
        }
        count += 1
        print(maxProb)
    }
    var ans = maxProb[end]
    if ans == -9223372036854775807 {
        ans = 0
    }
    return ans
}
