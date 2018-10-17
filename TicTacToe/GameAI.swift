//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // Check verticals
    for x in 0..<3 {
        var numMarks = 0
        for y in 0..<3 { // For each row in this column
            if board[(x,y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // Check horizontal wins
    for y in 0..<3 {
        var numMarks = 0
        for x in 0..<3 { // For each column in this row
            if board[(x,y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // Check diagonal wins
    if (board[(0, 0)] == player && board[(1, 1)] == player && board[(2, 2)] == player) || ((board[(2, 0)] == player && board[(1, 1)] == player && board[(0, 2)] == player)) {
        return true
    }

    return false
}
