//
//  GasStation.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-13.
//

import Foundation

func canCompleteCircuit3(_ gas: [Int], _ cost: [Int]) -> Int {
    var dif = [Int]()
    for i in 0..<gas.count {
        dif.append(gas[i] - cost[i])
    }
    var gasCostTotal = 0
    for i in 0..<dif.count {
        gasCostTotal += dif[i]
    }
    if gasCostTotal < 0 {
        return -1
    } else {
        for i in 0..<dif.count {
            if dif[i] >= 0 {
                var total = 0
                var index = i
                while index < dif.count {
                    total += dif[index]
                    if total < 0 {
                        index = dif.count
                    }
                    index += 1
                }
                if index == dif.count {
                    return i
                }
            }
        }
    }
    return -1
}

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var dif = [Int](repeating: 0, count: gas.count)
    var isEnoughGas = 0
    for i in 0..<gas.count {
        dif[i] = gas[i] - cost[i]
        isEnoughGas += gas[i]
        isEnoughGas -= cost[i]
    }
    if isEnoughGas < 0 {
        return -1
    }
    
    for i in 0..<dif.count {
        var tank = 0
        var next = i
        var finish = false
        while next != dif.count {
            tank += dif[next]
            if tank < 0 {
                next = dif.count
            } else {
                next += 1
            }
        }
        if tank >= 0 {
            return i
        }
    }
    return -1
}

func canCompleteCircuit2(_ gas: [Int], _ cost: [Int]) -> Int {
    var possibleStart = [Int]()
    for i in 0..<gas.count {
        if gas[i] >= cost[i] {
            possibleStart.append(i)
        }
    }
    var outOfGas = false
    var inLoop = true
    var ans = -1
    if possibleStart.isEmpty {
        return ans
    }
    while inLoop {
        let start = possibleStart.removeFirst()
        if possibleStart.isEmpty {
            inLoop = false
        }
        var tank = gas[start]
        outOfGas = false
        for i in start..<cost.count + start {
            if i > gas.count - 1 {
                tank -= cost[i - gas.count]
            } else {
                tank -= cost[i]
            }
            if tank >= 0 {
                if i >= gas.count - 1 {
                    tank += gas[i - gas.count + 1]
                } else {
                    tank += gas[i + 1]
                }
            } else {
                outOfGas = true
            }
        }
        if !outOfGas {
            inLoop = false
            ans = start
        }
    }
    return ans
}

//Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
//Output: 3
//Input: gas = [2,3,4], cost = [3,4,3]
//Output: -1
