//
//  Diameter.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-31.
//

import Foundation

var distance = 0
var longestTree = [Int]()
var recursiveCount = 1

func diameter() {
    let nodeSum = Int(String(readLine()!))!
    var adjacencyList = [[Int]](repeating: [], count: nodeSum)
    for i in 0..<nodeSum {
        let edgeInfo = readLine()!.split(separator: " ")
        var index = 0
        while edgeInfo[index] != "-1" {
            adjacencyList[i].append(Int(String(edgeInfo[index]))!)
            index += 1
        }
    }

    var tree = [Int]()
    for i in 1...nodeSum {
        diameter(sum: 0, tree: tree, next: i, adjList: adjacencyList)
        recursiveCount += 1
    }
    print(distance)
    print(longestTree)
}

func diameter(sum: Int, tree: [Int], next: Int, adjList: [[Int]]) {
    if tree.contains(next) {
        if sum > distance {
            distance = sum
            longestTree = tree
        }
        return
    } else {
        var edgeIndex = 1
        while edgeIndex != adjList[next - 1].count {
            if adjList[next - 1].count == 3 && next != recursiveCount {
                var newTree = tree
                newTree.append(next)
                if distance < sum {
                    distance = sum
                    longestTree = newTree
                }
                return
            } else {
                diameter(sum: sum + adjList[next - 1][edgeIndex + 1], tree: tree.appendToNewArray(newElement: next), next: adjList[next - 1][edgeIndex] , adjList: adjList)
            }
            edgeIndex += 2
        }
    }
}

extension Array {
    func appendToNewArray(newElement: Element) -> Array {
        var result = self
        result.append(newElement)
        return result
    }
}
