//
//  Diameter.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-31.
//

import Foundation

var adjL = [[Int]]()
func diameter2() {
    let nodeSum = Int(String(readLine()!))!

    adjL = [[Int]](repeating: [], count: nodeSum)
    for i in 0..<nodeSum {
        let edgeInfo = readLine()!.split(separator: " ")
        var index = 1
        while edgeInfo[index] != "-1" {
            if Int(String(edgeInfo[index]))! > i + 1 {
                adjL[i].append(Int(String(edgeInfo[index]))!)
                adjL[i].append(Int(String(edgeInfo[index + 1]))!)
            }
            index += 2
        }
    }
    
    diameter2(next: 1)
    print(dia)
}

var dia = 0
func diameter2(next: Int) -> Int{
    if adjL[next - 1].isEmpty {
        return 0
    } else {
        if adjL[next - 1].count == 4 {
            let left = diameter2(next: adjL[next - 1][0]) + adjL[next - 1][1]
            let right = diameter2(next: adjL[next - 1][2]) + adjL[next - 1][3]
            dia = max(dia, left + right)
            return max(left, right)
        } else {
            let left = diameter2(next: adjL[next - 1][0]) + adjL[next - 1][1]
            dia = max(dia, left)
            return left
        }
    }
}

//func diameter() {
//    // create Tree
//    let nodeSum = Int(String(readLine()!))!
//    // create adjacencey list
//    var adjacencyList = [[Int]](repeating: [], count: nodeSum)
//    for i in 0..<nodeSum {
//        let edgeInfo = readLine()!.split(separator: " ")
//        var index = 0
//        while edgeInfo[index] != "-1" {
//            adjacencyList[i].append(Int(String(edgeInfo[index]))!)
//            index += 1
//        }
//    }
//
//    let tree = [Int]()
//    for i in 1...nodeSum {
//        diameter(tree: tree.appendToNewArray(newElement: i), adjList: adjacencyList, next: i, sum: 0)
//    }
//    print(longestTree)
//    print(distance)
//}
//
//var longestTree = [Int]()
//var distance = 0
//func diameter(tree: [Int], adjList: [[Int]], next: Int, sum: Int) {
//    if adjList[next - 1].count == 3 && tree.count != 1 {
//        if sum > distance {
//            distance = sum
//            longestTree = tree
//        }
//        return
//    } else {
//        var edgeIndex = 1
//        while edgeIndex != adjList[next - 1].count {
//            if tree.count < 2 || tree[tree.count - 2] != adjList[next - 1][edgeIndex] {
//                diameter(tree: tree.appendToNewArray(newElement: adjList[next - 1][edgeIndex]), adjList: adjList, next: adjList[next - 1][edgeIndex], sum: sum + adjList[next - 1][edgeIndex + 1])
//            }
//            edgeIndex += 2
//        }
//    }
//}
//
//extension Array {
//    func appendToNewArray(newElement: Element) -> Array {
//        var result = self
//        result.append(newElement)
//        return result
//    }
//}

//Sample Input1
//5
//1 3 2 -1
//2 4 4 -1
//3 1 2 4 3 -1
//4 2 4 3 3 5 6 -1
//5 4 6 -1
//
//Sample Output1
//11
//
//
//
//
//
//
//
//
//
//
//
//Sample Input2
//8
//1 3 2 -1
//2 4 4 -1
//3 1 2 4 3 6 2 -1
//4 2 4 3 3 5 6 -1
//5 4 6 -1
//6 3 2 7 4 -1
//7 6 4 8 5 -1
//8 7 5 -1
//
//Sample Output2
//20
