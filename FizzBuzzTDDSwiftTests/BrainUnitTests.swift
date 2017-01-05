//
//  BrainTests.swift
//  FizzBuzzTDDSwift
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/4/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import XCTest

@testable import FizzBuzzTDDSwift

class BrainUnitTests: XCTestCase {
	
	let brain = Brain()
	
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
	
	func testIsDivisibleByThree() {
		let result = brain.isDividedByThree(6)
		XCTAssertTrue(result, "6 should be divisible by 3")
	}
	
	func testIsNotDivisibleByThree() {
		let result = brain.isDividedByThree(5)
		XCTAssertFalse(result, "5 should not be divisible by 3")
	}
	
	
	func testIsDivisibleByFive() {
		let result = brain.isDividedByFive(10)
		XCTAssertTrue(result, "10 should be divisible by 5")
	}
	
	func testIsNotDivisibleByFive() {
		let result = brain.isDividedByFive(12)
		XCTAssertFalse(result, "12 should not be divisible by 5")
	}
	
	func testIsDivisibleByFifteen() {
		let result = brain.isDividedByFive(30)
		XCTAssertTrue(result, "30 should be divisible by 15")
	}
	
	func testIsNotDivisibleByFifteen() {
		let result = brain.isDividedByFive(32)
		XCTAssertFalse(result, "32 should not be divisible by 15")
	}
		
	func testSayFizzBuzz() {
		let number = 30
		let result = brain.checkNumber(number)
		XCTAssertEqual(result, .fizzBuzz, "\(number) should say FizzBuzz")
	}
	
	func testSayFizz(){
		let number = 6
		let result = brain.checkNumber(number)
		XCTAssertEqual(result, .fizz, "\(number) should say Fizz")
	}
	
	func testSayBuzz(){
		let number = 20
		let result = brain.checkNumber(number)
		XCTAssertEqual(result, .buzz, "\(number) should say Buzz")
	}
	
	func testSayNumber(){
		let number = 1
		let result = brain.checkNumber(number)
		XCTAssertEqual(result, .number, "\(number) should say \(number)")
		
	}
	func testSayZero(){
		let number = 0
		let result = brain.checkNumber(number)
		XCTAssertEqual(result, .number, "\(number) should say \(number)")
		
	}
	
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
	
}
