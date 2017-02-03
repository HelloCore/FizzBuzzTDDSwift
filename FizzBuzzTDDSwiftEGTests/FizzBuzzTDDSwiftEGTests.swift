//
//  FizzBuzzTDDSwiftEGTests.swift
//  FizzBuzzTDDSwiftEGTests
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/3/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import XCTest
import EarlGrey

class FizzBuzzTDDSwiftEGTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("clearBtn")).perform(grey_tap())
        super.tearDown()
    }
	
	func testTabButtonNumberButtonIncreased() {
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn")).perform(grey_tap()).assert(with: grey_buttonTitle("1"))
	}
	
	func testTabButtonScoreIncreased() {
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn")).perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("scoreLabel")).assert(with: grey_text("Score: 1 | High Score: 0"))
	}
	
	func testTabWrongButtonScoreNotIncreased() {
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("fizzBtn")).perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("scoreLabel")).assert(with: grey_text("Score: 0 | High Score: 0"))
		
		EarlGrey.select(elementWithMatcher: grey_allOfMatchers([
			grey_not(grey_accessibilityID("playAgainBtn")),
			grey_not(grey_ancestor(grey_accessibilityID("playAgainBtn"))),
			grey_text("Play Again")]))
			.perform(grey_tap())
		
	}
	
	func testPlayToFizz() {
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn")).perform(grey_tap())
																				.perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("fizzBtn")).perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("scoreLabel")).assert(with: grey_text("Score: 3 | High Score: 0"))
	}
	
	func testPlayToBuzz() {
		let numberBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn"))
		let fizzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("fizzBtn"))
		let buzzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("buzzBtn"))
		
		numberBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		buzzBtn.perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("scoreLabel")).assert(with: grey_text("Score: 5 | High Score: 0"))
	}
	
	func testPlayToFizzBuzz() {
		let numberBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn"))
		let fizzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("fizzBtn"))
		let buzzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("buzzBtn"))
		let fizzBuzzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("fizzBuzzBtn"))
		
		numberBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		buzzBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		buzzBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBuzzBtn.perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("scoreLabel")).assert(with: grey_text("Score: 15 | High Score: 0"))
	}
	
	func testPlayToGameOverFirstTime() {
		let numberBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn"))
		let fizzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("fizzBtn"))
		
		numberBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		
		
		EarlGrey.select(elementWithMatcher: grey_text("Your score is 3 and high score is 0")).assert(with: grey_sufficientlyVisible())
		
		EarlGrey.select(elementWithMatcher: grey_allOfMatchers([
														grey_not(grey_accessibilityID("playAgainBtn")),
														grey_not(grey_ancestor(grey_accessibilityID("playAgainBtn"))),
														grey_text("Play Again")]))
											.perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn")).assert(with: grey_buttonTitle("0"))
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("scoreLabel")).assert(with: grey_text("Score: 0 | High Score: 3"))

	}
	
	func testPlayToGameOverSecondTime() {
		let numberBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn"))
		let fizzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("fizzBtn"))
		let buzzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("buzzBtn"))
		
		numberBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_allOfMatchers([
			grey_not(grey_accessibilityID("playAgainBtn")),
			grey_not(grey_ancestor(grey_accessibilityID("playAgainBtn"))),
			grey_text("Play Again")]))
			.perform(grey_tap())
		
		
		numberBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		buzzBtn.perform(grey_tap())
		buzzBtn.perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_text("Your score is 5 and high score is 3")).assert(with: grey_sufficientlyVisible())
		
		
		EarlGrey.select(elementWithMatcher: grey_allOfMatchers([
			grey_not(grey_accessibilityID("playAgainBtn")),
			grey_not(grey_ancestor(grey_accessibilityID("playAgainBtn"))),
			grey_text("Play Again")]))
			.perform(grey_tap())
		
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn")).assert(with: grey_buttonTitle("0"))
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("scoreLabel")).assert(with: grey_text("Score: 0 | High Score: 5"))
		
	}
	
	func testPlayAgainBtn() {
		let numberBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn"))
		let fizzBtn = EarlGrey.select(elementWithMatcher: grey_accessibilityID("fizzBtn"))
		
		numberBtn.perform(grey_tap())
		numberBtn.perform(grey_tap())
		fizzBtn.perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("playAgainBtn")).perform(grey_tap())
		EarlGrey.select(elementWithMatcher: grey_text("OK")).assert(with: grey_sufficientlyVisible()).perform(grey_tap())
		
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("numberBtn")).assert(with: grey_buttonTitle("0"))
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("scoreLabel")).assert(with: grey_text("Score: 0 | High Score: 3"))
	}

	
}
