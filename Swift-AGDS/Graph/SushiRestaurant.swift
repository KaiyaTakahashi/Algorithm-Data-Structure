//
//  SushiRestaurant.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-04.
//

import Foundation

func sushiRestaurant2() {
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
    print(adjList)
    removeFakeLeaf(next: 0, prev: 0)
    print(adjList)
}

func removeFakeLeaf(next: Int, prev: Int) {
    if adjList![next].count == 1 && next != 0 {
        if real.contains(next) {
            return
        }
        let connected = adjList![next].remove(at: 0)
        adjList![next] = []
        return
    } else {
        print(adjList![next])
        var edgeIndex = 0
        while edgeIndex != adjList![next].count {
            if adjList![next][edgeIndex] != prev {
                removeFakeLeaf(next: adjList![next][edgeIndex], prev: next)
            }
            edgeIndex += 1
        }
    }
}

func sushiRestaurant2(next: Int) {
    
}

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

    while real.count > 1 {
        var lca: Int = -1
        var tempI = -1
        var comparedEdge = -1
        for i in 1..<real.count {
            let result = lca2(x: real[0], y: real[i], adjList: adjList!)
            if result > lca {
                comparedEdge = real[i]
                tempI = i
            }
            lca = result > lca ? result: lca
        }
        let edge = real.remove(at: real.firstIndex(of: real[0])!)
        real.remove(at: real.firstIndex(of: real[tempI - 1])!)
        sushiRestaurant(dest: edge, next: lca, prev: -1, count: 0)
        var distanceA = partialPath
        sushiRestaurant(dest: comparedEdge, next: lca, prev: -1, count: 0)
        var distanceB = partialPath
        if distanceA > distanceB && lca != 0 {
            distanceA *= 2
            totalPath += distanceB
            totalPath += distanceA
        } else if distanceB > distanceA && lca != 0 {
            distanceB *= 2
            totalPath += distanceB
            totalPath += distanceA
        } else if distanceA == distanceB && lca != 0 {
            distanceB *= 2
            totalPath += distanceB
            totalPath += distanceA
        } else {
            totalPath += distanceB
            totalPath += distanceA
        }
    }
    print(totalPath)
}

var totalPath = 0
var partialPath = 0
func sushiRestaurant(dest: Int, next: Int, prev: Int, count: Int) {
    if next == dest {
        partialPath = count
        return
    } else if adjList![next].count == 1 {
        return
    } else {
        var edgeIndex = 0
        while edgeIndex != adjList![next].count {
            if adjList![next][edgeIndex] > next && adjList![next][edgeIndex] > prev {
                sushiRestaurant(dest: dest, next: adjList![next][edgeIndex], prev: next, count: count + 1)
            }
            edgeIndex += 1
        }
    }
}

//8 5
//0 6 4 3 7
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3
