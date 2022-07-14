//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var board = Board(size: 8)

func solveQueens(board: inout Board) {
    solveQueensHelper(board: &board, nextRow: 0, currentCol: 0)
}

func solveQueensHelper(board: inout Board, nextRow: Int, currentCol: Int) {
    // Task 2
//    count += 1
    if nextRow == 8 {
        // Task 1
        print(board)
        count += 1

        // Task 2
//        print(count)
//        exit(0)
        board.remove(row: 7, col: currentCol)
        return
    } else {
        for i in 0...7 {
            if board.isSafe(row: nextRow, col: i) {
                board.place(row: nextRow, col: i)
                solveQueensHelper(board: &board, nextRow: nextRow + 1, currentCol: i)
            }
        }
        board.remove(row: nextRow - 1, col: currentCol)
        return
    }
}
