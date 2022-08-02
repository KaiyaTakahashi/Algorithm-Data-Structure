//
//  Diameter.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-31.
//

import Foundation

func diameter() {
    // create Tree
    let nodeSum = Int(String(readLine()!))!
    // create adjacencey list
    var adjacencyList = [[Int]](repeating: [], count: nodeSum)
    for i in 0..<nodeSum {
        let edgeInfo = readLine()!.split(separator: " ")
        var index = 0
        while edgeInfo[index] != "-1" {
            adjacencyList[i].append(Int(String(edgeInfo[index]))!)
            index += 1
        }
    }
    print(adjacencyList)
    var tree = [Int]()
    for i in 1...nodeSum {
        diameter(sum: 0, tree: tree, next: i, adjList: adjacencyList)
        recursiveCount += 1
    }
}
var distance = 0
var longestTree = [Int]()
var recursiveCount = 1
func diameter(sum: Int, tree: [Int], next: Int, adjList: [[Int]]) {
    print(sum)
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
                print(newTree)
                return
            } else {
                print(sum + adjList[next - 1][edgeIndex + 1])
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

//Sample Input1
//5
//1 3 2 -1
//2 4 4 -1
//3 1 2 4 3 -1
//4 2 4 3 3 5 6 -1
//5 4 6 -1
//Sample Output1
//11
