//
//  main.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-07-11.
//

import Foundation

//6 8
//1 2
//1 5
//2 3
//2 4
//2 5
//5 4
//4 3
//4 6

//6 5
//1 2
//2 5
//5 1
//3 4
//4 6

//6 5
//1 4
//1 6
//2 4
//2 3
//3 2
//4 1
//4 2
//5 6
//6 1
//6 5

let graph: [String: [String]] = [
    "f": ["g", "i"],
    "g": ["h"],
    "h": [],
    "i": ["g", "k"],
    "j": ["i"],
    "k": []
]

func isReachable(graph: [String: [String]], target: String) -> Bool {
    var stack = Stack<String>()
    stack.push(item: "f")
    
    while stack.count != 0 {
        let next = stack.pop()!
        if next == target {
            return true
        }
        if !graph[next]!.isEmpty {
            for i in graph[next]! {
                stack.push(item: i)
            }
        }
    }
    return false
}

//diameter()
//
//Diameter - (40 %)
//
//The diameter of a tree is the longest distance between any two nodes in the tree. Write a program to determine the diameter of the tree.
//
//Input Specification
//Trees are given as input.
//First line: V (the number of vertices, 2 <= V <= 100,000)
//Next V lines: each vertex number followed by two integers representing the information of the connected edges.
//Format: V V1 D1 V2 D2 … -1  (-1 at the end of each line)
//V1: connected vertex from V
//D1: distance from vertex V to V1
//(All distances, 1 <= D1, D2, … <= 10,000)
//
//Output Specification
//Print the diameter of the tree.
//
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



//Sample Input1
//5
//1 3 2 -1
//2 -1
//3 1 2 4 3 -1
//4 3 3 5 6 -1
//5 4 6 -1
//
//Sample Output1
//11

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
//
//<< Bonus Question - 5 % >>
//Write a simple script to test your code.
//Testing your code test case by test case is a boring and time consuming job.
//You will be given a set of test files for both questions.
//Check your slack for the test cases
//*.in for input and *.out for output
//You can use any language to complete the task.
//Googling/stack overflowing allowed.
