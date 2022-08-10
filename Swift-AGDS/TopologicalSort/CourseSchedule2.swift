//
//  CourseSchedule2.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-10.
//

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var adjList = createAdjList(prerequisites: prerequisites, count: numCourses)
    var indegree = createIndegree(prerequisites: prerequisites, count: numCourses)
    var path = [Int]()
    let queue = Queue<Int>()
    for i in 0..<indegree.count {
        if indegree[i].isEmpty {
            queue.enqueue(item: i)
        }
    }
    if queue.isEmpty() {
        return []
    }
    while !queue.isEmpty() {
        let vertex = queue.dequeue()!
        for i in 0..<indegree.count {
            if indegree[i].contains(vertex) {
                let index = indegree[i].firstIndex(of: vertex)!
                indegree[i].remove(at: index)
                if indegree[i].isEmpty {
                    queue.enqueue(item: i)
                }
            }
        }
        path.append(vertex)
    }
    if path.count != numCourses {
        return []
    }
    return  path
}

fileprivate func createAdjList(prerequisites: [[Int]], count: Int) -> [[Int]] {
    var adjList = [[Int]](repeating: [], count: count)
    
    for i in 0..<prerequisites.count {
        adjList[prerequisites[i][1]].append(prerequisites[i][0])
    }
    return adjList
}

fileprivate func createIndegree(prerequisites: [[Int]], count: Int) -> [[Int]] {
    var indegree = [[Int]](repeating: [], count: count)
    
    for i in 0..<prerequisites.count {
        indegree[prerequisites[i][0]].append(prerequisites[i][1])
    }
    return indegree
}
//Input: numCourses = 2, prerequisites = [[1,0]]
//Output: [0,1]
//Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
//Output: [0,2,1,3]
