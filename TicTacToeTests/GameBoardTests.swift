//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Scott Bennett on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    
    func testIsThereAMarkAtZeroZero() {
        let board = GameBoard()
        let mark = board[(0, 0)]
        XCTAssertNil(mark)
    }

    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        XCTAssertFalse(board.isFull)
        for x in 0..<3 {
            for y in 0..<3 {
                let mark = board[(x, y)]
                XCTAssertNil(mark)
            }
        }
    }

    func testPlacingMarks() {
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        
        for x in 0..<3 {
            for y in 0..<3 {
                let mark = board[(x, y)]
                if x == 0 && y == 0 {
                    XCTAssertEqual(mark, .x)
                    continue
                }
                XCTAssertNil(mark)
            }
        }
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 0)))
        XCTAssertEqual(board[(1, 0)], .x)
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 0)))
        XCTAssertEqual(board[(2, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 1)))
        XCTAssertEqual(board[(0, 1)], .x)
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 1)))
        XCTAssertEqual(board[(1, 1)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 1)))
        XCTAssertEqual(board[(2, 1)], .x)
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 2)))
        XCTAssertEqual(board[(0, 2)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 2)))
        XCTAssertEqual(board[(1, 2)], .x)
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .o)
        
        // Make sure you can't change an already marked square.
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { error in
            XCTAssertEqual(error as? GameBoardError, .invalidSquare)
        }
    }
    
    func testFillingBoard() {
        var board = GameBoard()
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertFalse(board.isFull)
                try! board.place(mark: .x, on: (x, y))
            }
        }
        XCTAssertTrue(board.isFull)
    }
    
    func testBoardIsFull() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .x, on: (2, 2))
        
        XCTAssertTrue(board.isFull)
        
    }
    
}
