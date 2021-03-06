//
//  GameTests.swift
//  FizzBuzzTDDSwift
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/4/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import XCTest

@testable import FizzBuzzTDDSwift

class GameUnitTests: XCTestCase {
	
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
		let result = game.play(.fizz).isRight
		XCTAssertEqual(result, true)
	}
	
	func testIfMoveFizzIsWrong() {
		game.score = 1
		let result = game.play(.fizz).isRight
		XCTAssertEqual(result, false)
	}
	
	func testIfMoveBuzzIsRight() {
		game.score = 4
		let result = game.play(.buzz).isRight
		XCTAssertEqual(result, true)
	}
	
	func testIfMoveBuzzIsWrong() {
		game.score = 5
		let result = game.play(.buzz).isRight
		XCTAssertEqual(result, false)
	}
	
	func testIfMoveFizzBuzzIsRight() {
		game.score = 29
		let result = game.play(.fizzBuzz).isRight
		XCTAssertEqual(result, true)
	}
	
	func testIfMoveFizzBuzzIsWrong() {
		game.score = 30
		let result = game.play(.fizzBuzz).isRight
		XCTAssertEqual(result, false)
	}
	
	func testIfMoveNumberIsRight() {
		game.score = 40
		let result = game.play(.number).isRight
		XCTAssertEqual(result, true)
	}
	
	func testIfMoveNumberIsWrong() {
		game.score = 29
		let result = game.play(.number).isRight
		XCTAssertEqual(result, false)
	}
	
	func testIfMoveWrongScoreNotIncreased() {
		game.score = 1
		let _ = game.play(.fizz)
		XCTAssertEqual(game.score, 1, "Score should not increased")
	}
	
	func testIfMoveRightScoreIncreased() {
		game.score = 1
		let _ = game.play(.number)
		XCTAssertEqual(game.score, 2, "Score should increased")
		
	}
	
}
