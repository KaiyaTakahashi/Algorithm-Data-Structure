//
//  TwoCityScheduling.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-13.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var dif = [[Int]](repeating: [], count: costs.count)
    for i in 0..<costs.count {
        dif[i].append(costs[i][0] - costs[i][1])
        dif[i].append(costs[i][0])
        dif[i].append(costs[i][1])
    }

    let difInOrder = dif.sorted { $0[0] > $1[0] }
    var total = 0
    for i in 0..<difInOrder.count {
        if i < difInOrder.count / 2 {
            total += difInOrder[i][2]
        } else {
            total += difInOrder[i][1]
        }
    }
    
    return total
}

//func twoCitySchedCost(_ costs: [[Int]]) -> Int {
//    var cheapest = -1
//    func twoCitySchedCost(next: Int, total: Int, aCount: Int, bCount: Int) {
//        if aCount > costs.count / 2 || bCount > costs.count / 2 {
//            return
//        } else if next == costs.count {
//            if cheapest == -1 {
//                cheapest = total
//            } else {
//                if cheapest > total {
//                    cheapest = total
//                }
//            }
//            return
//        } else {
//            var i = 0
//            var done = false
//            while i != 2 {
//                let min = min(costs[next][0], costs[next][1])
//                let max = max(costs[next][0], costs[next][1])
//                if min == costs[next][0] {
//                    if !done {
//                        done = true
//                        twoCitySchedCost(next: next + 1, total: total + min, aCount: aCount + 1, bCount: bCount)
//                    } else {
//                        twoCitySchedCost(next: next + 1, total: total + max, aCount: aCount, bCount: bCount + 1)
//                    }
//                } else {
//                    if !done {
//                        done = true
//                        twoCitySchedCost(next: next + 1, total: total + min, aCount: aCount, bCount: bCount + 1)
//                    } else {
//                        twoCitySchedCost(next: next + 1, total: total + max, aCount: aCount + 1, bCount: bCount)
//                    }
//                }
//                i += 1
//            }
//        }
//    }
//    twoCitySchedCost(next: 0, total: 0, aCount: 0, bCount: 0)
//    return cheapest
//}

