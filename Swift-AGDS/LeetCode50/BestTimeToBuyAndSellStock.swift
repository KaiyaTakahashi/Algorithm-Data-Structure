//
//  BestTimeToBuyAndSellStock.swift
//  Swift-AGDS
//
//  Created by Kaiya Takahashi on 2022-10-06.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var map = [Int](repeating: 0, count: prices.count)
    var max = prices[prices.count - 1]
    for i in stride(from: prices.count - 1, to: -1, by: -1) {
        if max < prices[i] {
            max = prices[i]
        }
        map[i] = max
    }
    var profits = [Int](repeating: 0, count: map.count)
    for i in 0..<map.count {
        profits[i] = map[i] - prices[i]
    }
    return profits.max()!
}
