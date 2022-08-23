//
//  MinimumCostFlow.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-18.
//

import Foundation

func minimumCostFlow() -> Int {
    let firstLine = readLine()!.split(separator: " ")
    let verNum = Int(firstLine[0])!
    let scanNum = Int(firstLine[1])!
    let enhancer = Int(firstLine[2])!

    var pipeMap = [[Int]](repeating: [], count: scanNum)
    for i in 0..<scanNum {
        let line = readLine()!.split(separator: " ")
        let edgeInfo = line.map { Int(String($0))! }
        pipeMap[i] = edgeInfo
    }

    let sortPipeMap = pipeMap.sorted { $0[2] < $1[2] }
    var uf = UF(verNum)
    var minPipeMap = Set<[Int]>()

    for i in 0..<scanNum {
        if !uf.connected(sortPipeMap[i][0] - 1, sortPipeMap[i][1] - 1) {
            minPipeMap.insert(sortPipeMap[i])
            uf.union(sortPipeMap[i][0] - 1, sortPipeMap[i][1] - 1)
        }
    }
    var cityPipeMap = Set<[Int]>()
    for i in 0..<verNum - 1 {
        cityPipeMap.insert(pipeMap[i])
    }
    var replacableCityPipes = cityPipeMap.subtracting(minPipeMap)
    var replacableMinPipes = minPipeMap.subtracting(cityPipeMap)
    if replacableMinPipes.count == 0 {
        return 0
    }
    let totalDays = replacableMinPipes.count
    var lowestCityPipe = replacableCityPipes.removeFirst()[2]
    while !replacableCityPipes.isEmpty {
        let cityPipe = replacableCityPipes.removeFirst()[2]
        if lowestCityPipe > cityPipe {
            lowestCityPipe = cityPipe
        }
    }
    var highestMinPipe = replacableMinPipes.removeFirst()[2]
    while !replacableMinPipes.isEmpty {
        let minPipe = replacableMinPipes.removeFirst()[2]
        if highestMinPipe > minPipe {
            highestMinPipe = minPipe
        }
    }

    if lowestCityPipe - enhancer <= highestMinPipe {
        return totalDays - 1
    } else {
        return totalDays
    }
}

func minimumCostFlow(input: [[Int]]) -> Int {
    let verNum = input[0][0]
    let scanNum = input[0][1]
    let enhancer = input[0][2]

    var pipeMap = [[Int]](repeating: [], count: scanNum)
    for i in 1..<scanNum + 1 {
        pipeMap[i - 1] = input[i]
    }
    
    let sortPipeMap = pipeMap.sorted { $0[2] < $1[2] }
    var uf = UF(verNum)
    var minPipeMap = Set<[Int]>()

    for i in 0..<scanNum {
        if !uf.connected(sortPipeMap[i][0] - 1, sortPipeMap[i][1] - 1) {
            minPipeMap.insert(sortPipeMap[i])
            uf.union(sortPipeMap[i][0] - 1, sortPipeMap[i][1] - 1)
        }
    }
    var cityPipeMap = Set<[Int]>()
    for i in 0..<verNum - 1 {
        cityPipeMap.insert(pipeMap[i])
    }
    var replacableCityPipes = cityPipeMap.subtracting(minPipeMap)
    var replacableMinPipes = minPipeMap.subtracting(cityPipeMap)
    if replacableMinPipes.count == 0 {
        return 0
    }
    let totalDays = replacableMinPipes.count
    var lowestCityPipe = replacableCityPipes.removeFirst()[2]
    while !replacableCityPipes.isEmpty {
        let cityPipe = replacableCityPipes.removeFirst()[2]
        if lowestCityPipe > cityPipe {
            lowestCityPipe = cityPipe
        }
    }
    var highestMinPipe = replacableMinPipes.removeFirst()[2]
    while !replacableMinPipes.isEmpty {
        let minPipe = replacableMinPipes.removeFirst()[2]
        if highestMinPipe > minPipe {
            highestMinPipe = minPipe
        }
    }

    if lowestCityPipe - enhancer <= highestMinPipe {
        return totalDays - 1
    } else {
        return totalDays
    }
}
//Sample Input 1
//4 4 0
//1 2 1
//2 3 2
//3 4 1
//4 1 1
//
//Sample Output 1
//1
//
//Sample Input 2
//5 6 2
//1 2 5
//2 3 5
//1 4 5
//4 5 5
//1 3 1
//1 5 1
//
//Sample Output 2
//2
//
//Sample Input 3
//4 4 0
//1 2 715827882
//2 3 715827882
//3 4 715827882
//4 1 715827884
//
//Sample Output 3
//0
