//
//  CourseSchedule.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-10.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    let queue = Queue<Int>()
    var indegree = createIndegree(prerequisites: prerequisites, count: numCourses)
    var adjList = createAdjList(prerequisites: prerequisites, count: numCourses)

    for i in 0..<indegree.count {
        if indegree[i].count == 0 {
            queue.enqueue(item: i)
        }
    }
    if queue.isEmpty() {
        return false
    }
    
    while !queue.isEmpty() {
        let vertex = queue.dequeue()!
        for i in 0..<adjList[vertex].count {
            let edge = adjList[vertex][i]
            let index = indegree[edge].firstIndex(of: vertex)!
            indegree[edge].remove(at: index)
            if indegree[edge].isEmpty {
                queue.enqueue(item: edge)
            }
        }
        
    }
    for i in indegree {
        if !i.isEmpty {
            return false
        }
    }
    return true
}

fileprivate func createIndegree(prerequisites: [[Int]], count: Int) -> [[Int]] {
    var indegree = [[Int]](repeating: [], count: count)
    
    for i in 0..<prerequisites.count {
        indegree[prerequisites[i][0]].append(prerequisites[i][1])
    }
    return indegree
}

fileprivate func createAdjList(prerequisites: [[Int]], count: Int) -> [[Int]] {
    var adjList = [[Int]](repeating: [], count: count)
    
    for i in 0..<prerequisites.count {
        adjList[prerequisites[i][1]].append(prerequisites[i][0])
    }
    return adjList
}
