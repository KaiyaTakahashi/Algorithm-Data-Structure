//
//  BoatsToSavePeople.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-21.
//

import Foundation

func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
    var sortPeople = people.sorted { $0 > $1 }
    var count = 0
    var dif = sortPeople.map { limit - $0 }
    print(dif)
    print(sortPeople)
    while !sortPeople.isEmpty {
        var boatLimit = 0
        let sortFirst = sortPeople.removeFirst()
        let difFirst = dif.removeFirst()
        if difFirst == 0 {
            count += 1
        } else if sortPeople.contains(difFirst) {
            let index = sortPeople.lastIndex(of: difFirst)!
            sortPeople.remove(at: index)
            count += 1
        } else {
            boatLimit += sortFirst
            var sortLast = 0
            while boatLimit < limit && !sortPeople.isEmpty {
                sortLast = sortPeople.removeLast()
                boatLimit += sortLast
            }
            if boatLimit != limit {
                sortPeople.append(sortLast)
            }
            count += 1
        }
    }
    return count
}
