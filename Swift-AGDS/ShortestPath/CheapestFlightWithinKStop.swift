//
//  CheapestFlightWithinKStop.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-23.
//

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    struct Flight {
        let toCity: Int
        let price: Int
    }
    var adj = [[Flight]](repeating: [], count: n)
    for i in 0..<flights.count {
        adj[flights[i][0]].append(Flight(toCity: flights[i][1], price: flights[i][2]))
    }
    var shortestD = [Int](repeating: 2147483648, count: n)
    return 1
}
