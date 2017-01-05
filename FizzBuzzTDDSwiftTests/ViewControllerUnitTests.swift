//
//  ViewControllerUnitTests.swift
//  FizzBuzzTDDSwift
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/5/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import XCTest

@testable import FizzBuzzTDDSwift

class ViewControllerUnitTests: XCTestCase {
	
	var viewController: ViewController!
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
		
		UIApplication.shared.keyWindow!.rootViewController = viewController
		
		XCTAssertNotNil(viewController.view,"View must not nil")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testMovedScoreIncreased() {
		let oldScore = viewController.gameScore
		viewController.play(.number)
		let newScore = viewController.gameScore
		XCTAssertEqual(newScore, oldScore + 1, "Score must increase")
    }
	
	func testMoved2ScoreIncreased2() {
		let oldScore = viewController.gameScore
		viewController.play(.number)
		viewController.play(.number)
		let newScore = viewController.gameScore
		XCTAssertEqual(newScore, oldScore + 2, "Score must increase")
	}
	
	func testMoveIncorrectScoreNotIncreased() {
		let oldScore = viewController.gameScore
		viewController.play(.fizz)
		let newScore = viewController.gameScore
		XCTAssertEqual(newScore, oldScore, "Score must not increase")
	}
	
	func testMoveFizzScoreIncreased() {
		viewController.play(.number)
		viewController.play(.number)
		viewController.play(.fizz)
		let newScore = viewController.gameScore
		XCTAssertEqual(newScore, 3, "Score must be 3")
	}
	
	func testMoveBuzzScoreIncreased() {
		viewController.play(.number)
		viewController.play(.number)
		viewController.play(.fizz)
		viewController.play(.number)
		viewController.play(.buzz)
		let newScore = viewController.gameScore
		XCTAssertEqual(newScore, 5, "Score must be 5")
	}
	
	func testMoveFizzBuzzScoreIncreased() {
		viewController.play(.number)
		viewController.play(.number)
		viewController.play(.fizz)
		viewController.play(.number)
		viewController.play(.buzz)
		viewController.play(.fizz)
		viewController.play(.number)
		viewController.play(.number)
		viewController.play(.fizz)
		viewController.play(.buzz)
		viewController.play(.number)
		viewController.play(.fizz)
		viewController.play(.number)
		viewController.play(.number)
		viewController.play(.fizzBuzz)
		let newScore = viewController.gameScore
		XCTAssertEqual(newScore, 15, "Score must be 15")
	}
	
	
}
