//
//  CheapestFlightWithinKStop.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-23.
//

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    var sortedFlight = flights.sorted { $0[0] < $1[0] }
    while sortedFlight[0][0] != src {
        let first = sortedFlight.removeFirst()
        sortedFlight.append(first)
    }
    var shortestD = [Int](repeating: Int.max, count: n)
    var visited = [Int](repeating: -1, count: n)
    var count = 0
    shortestD[src] = 0
    while shortestD[dst] == Int.max {
        for i in 0..<flights.count {
            if shortestD[sortedFlight[i][1]] > shortestD[sortedFlight[i][0]] + sortedFlight[i][2] && visited[sortedFlight[i][1]] < k {
                shortestD[sortedFlight[i][1]] = shortestD[sortedFlight[i][0]] + sortedFlight[i][2]
                visited[sortedFlight[i][1]] = visited[sortedFlight[i][0]] + 1
            }
        }
        count += 1
        if count > n {
            return -1
        }
    }
    return shortestD[dst]
}
