//
//  GameTests.swift
//  FizzBuzzTDDSwift
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/4/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import XCTest

@testable import FizzBuzzTDDSwift

class GameTests: XCTestCase {
	
	let game = Game()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testGameStartAtZero() {
		XCTAssertEqual(game.score, 0, "Start score should be 0")
	}
	
	func testIfMoveFizzIsRight() {
		game.score = 2
		let result = game.play("Fizz")
		XCTAssertEqual(result, true)
	}
	
	func testIfMoveFizzIsWrong() {
		game.score = 1
		let result = game.play("Fizz")
		XCTAssertEqual(result, false)
	}
	
	func testIfMoveBuzzIsRight() {
		game.score = 4
		let result = game.play("Buzz")
		XCTAssertEqual(result, true)
	}
	
	func testIfMoveBuzzIsWrong() {
		game.score = 5
		let result = game.play("Buzz")
		XCTAssertEqual(result, false)
	}
	
	func testIfMoveFizzBuzzIsRight() {
		game.score = 29
		let result = game.play("FizzBuzz")
		XCTAssertEqual(result, true)
	}
	
	func testIfMoveFizzBuzzIsWrong() {
		game.score = 30
		let result = game.play("FizzBuzz")
		XCTAssertEqual(result, false)
	}
	
	func testIfMoveNumberIsRight() {
		game.score = 40
		let result = game.play("41")
		XCTAssertEqual(result, true)
	}
	
	func testIfMoveNumberIsWrong() {
		game.score = 29
		let result = game.play("30")
		XCTAssertEqual(result, false)
	}
	
	func testIfMoveWrongScoreNotIncreased() {
		game.score = 1
		let _ = game.play("3")
		XCTAssertEqual(game.score, 1, "Score should not increased")
	}
	
	func testIfMoveRightScoreIncreased() {
		game.score = 1
		let _ = game.play("2")
		XCTAssertEqual(game.score, 2, "Score should increased")
		
	}
	
}
