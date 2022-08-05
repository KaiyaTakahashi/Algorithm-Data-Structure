//
//  SushiRestaurant.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-04.
//

import Foundation

var total = 0
var real = [Int]()
var adjList: [[Int]]?
func sushiRestaurant() {
    let firstLine = readLine()!.split(separator: " ")
    let nodeSum = Int(String(firstLine[0]))!
    total = Int(String(firstLine[1]))!
    
    let nextLine = readLine()!.split(separator: " ")
    for i in 0..<nextLine.count {
        real.append(Int(String(nextLine[i]))!)
    }
    
    adjList = [[Int]](repeating: [], count: nodeSum)
    
    for i in 0..<nodeSum - 1 {
        let edge = readLine()!.split(separator: " ")
        let l = Int(String(edge[0]))!
        let r = Int(String(edge[1]))!
        adjList![l].append(r)
        adjList![r].append(l)
    }
    
    real = real.sorted { $0 > $1 }
    
//    var lca: Int = -1
//    var tempI = -1
//    for i in 1..<real.count - 1 {
//        let result = lca2(x: real[0], y: i, adjList: adjList!)
//        tempI = result > lca ? i: tempI
//        lca = result > lca ? result: lca
//    }
//    let edge = real.remove(at: real.firstIndex(of: real[0])!)
//    real.remove(at: real.firstIndex(of: real[tempI])!)
    sushiRestaurant(start: 6, dest: 3, next: 6, prev: -1, lca: 0, count: 0)
    print(totalPath)
}

var totalPath = 0
func sushiRestaurant(start: Int, dest: Int, next: Int, prev: Int, lca: Int, count: Int) {
    print("\(next) ->")
    if next == dest {
        totalPath = count + 1
        return
    } else if adjList![next].count == 1 && next != start {
        return
    } else {
        var edgeIndex = 0
        while edgeIndex != adjList![next].count {
            if next == lca {
                if adjList![next][edgeIndex] != prev && adjList![next][edgeIndex] > next {
                    sushiRestaurant(start: start, dest: dest, next: adjList![next][edgeIndex], prev: next, lca: lca, count: count + 1)
                }
            } else if adjList![next][edgeIndex] != prev {
                sushiRestaurant(start: start, dest: dest, next: adjList![next][edgeIndex], prev: next, lca: lca, count: count + 1)
            }
            edgeIndex += 1
        }
    }
}

//var visited = Set<Int>()
//var totalSteps = 0
//func sushiRestaurant(count: Int, next: Int, prev: Int, steps: Int) {
//    if count == real.count {
//        return
//    } else {
//        visited.insert(next)
//        var edgeIndex = 0
//        while edgeIndex != adjList![next].count {
//            if !visited.contains(adjList![next][edgeIndex]) {
//                if real.contains(adjList![next][edgeIndex]) {
//                    totalSteps += steps
//                    sushiRestaurant(count: count + 1, next: adjList![next][edgeIndex], prev: next, steps: steps)
//                } else {
//                    sushiRestaurant(count: count, next: adjList![next][edgeIndex], prev: next, steps: steps + 1)
//                }
//            }
//            edgeIndex += 1
//        }
//        return
//    }
//}
//Sample Input 1
//8 2
//5 2
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3
//
//Sample Output 1
//3
//
//Explanation for output1
//The path between 5 and 2 goes through 5 -> 1 -> 0 -> 2, which uses 3 roads.
//
//Sample Input 2
//8 5
//0 6 4 3 7
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3
//
//Sample Output 2
//7
