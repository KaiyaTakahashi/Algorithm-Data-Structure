//
//  corona.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-08-26.
//

import Foundation

func corona() -> Int {
    let n = Int(String(readLine()!))!
    var sum = Int(String(readLine()!))!
    let contagious = Int(String(readLine()!))!
    
    var queue = Queue<Int>()
    queue.enqueue(item: sum)
    var total = 0
    var day = 0
    while total < n {
        let nextInfect = queue.dequeue()! * contagious
        queue.enqueue(item: nextInfect)
        total += nextInfect
        day += 1
    }
    return day
}
