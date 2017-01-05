//
//  FizzBuzzTDDSwiftUITests.swift
//  FizzBuzzTDDSwiftUITests
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/4/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import XCTest

class FizzBuzzTDDSwiftUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTabButtonNumberButtonIncreased() {
		let app = XCUIApplication()
		let numberBtn = app.buttons["numberBtn"]
		numberBtn.tap()
		XCTAssertEqual(numberBtn.label, "1", "Score on button should increase")
    }
	
	func testTabButtonScoreIncreased() {
		let app = XCUIApplication()
		let numberBtn = app.buttons["numberBtn"]
		let scoreLabel = app.staticTexts["scoreLabel"]
		numberBtn.tap()
		XCTAssertEqual(scoreLabel.label, "Score: 1 | High Score: 0", "Score should increase")
	}
	
	func testTabWrongButtonScoreNotIncreased() {
		let app = XCUIApplication()
		let fizzBtn = app.buttons["fizzBtn"]
		let scoreLabel = app.staticTexts["scoreLabel"]
		fizzBtn.tap()
		XCTAssertEqual(scoreLabel.label, "Score: 0 | High Score: 0", "Score should increase")
	}
	
	func testPlayToFizz() {
		let app = XCUIApplication()
		let numberBtn = app.buttons["numberBtn"]
		let fizzBtn = app.buttons["fizzBtn"]
		let scoreLabel = app.staticTexts["scoreLabel"]
		numberBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		XCTAssertEqual(scoreLabel.label, "Score: 3 | High Score: 0", "Score should increase")
	}
	
	func testPlayToBuzz() {
		let app = XCUIApplication()
		let numberBtn = app.buttons["numberBtn"]
		let fizzBtn = app.buttons["fizzBtn"]
		let buzzBtn = app.buttons["buzzBtn"]
		let scoreLabel = app.staticTexts["scoreLabel"]
		numberBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		numberBtn.tap()
		buzzBtn.tap()
		XCTAssertEqual(scoreLabel.label, "Score: 5 | High Score: 0", "Score should increase")
	}
	
	func testPlayToFizzBuzz() {
		let app = XCUIApplication()
		let numberBtn = app.buttons["numberBtn"]
		let fizzBtn = app.buttons["fizzBtn"]
		let buzzBtn = app.buttons["buzzBtn"]
		let fizzBuzzBtn = app.buttons["fizzBuzzBtn"]
		let scoreLabel = app.staticTexts["scoreLabel"]
		numberBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		numberBtn.tap()
		buzzBtn.tap()
		fizzBtn.tap()
		numberBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		buzzBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		numberBtn.tap()
		numberBtn.tap()
		fizzBuzzBtn.tap()
		XCTAssertEqual(scoreLabel.label, "Score: 15 | High Score: 0", "Score should increase")
	}
	
	func testPlayToGameOverFirstTime() {
		let app = XCUIApplication()
		let numberBtn = app.buttons["numberBtn"]
		let fizzBtn = app.buttons["fizzBtn"]
		let scoreLabel = app.staticTexts["scoreLabel"]
		numberBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		fizzBtn.tap()
		
		let isLabelExists = app.alerts["Game Over"].staticTexts["Your score is 3 and high score is 0"].exists
		XCTAssertEqual(isLabelExists, true, "Label on alert shoule be updated")
		
		app.alerts["Game Over"].buttons["Play Again"].tap()
		XCTAssertEqual(scoreLabel.label, "Score: 0 | High Score: 3", "High score should be recorded")
		XCTAssertEqual(numberBtn.label, "0", "Score on button should be reset after game over")
	}
	
	func testPlayToGameOverSecondTime() {
		let app = XCUIApplication()
		let numberBtn = app.buttons["numberBtn"]
		let fizzBtn = app.buttons["fizzBtn"]
		let buzzBtn = app.buttons["buzzBtn"]
		let scoreLabel = app.staticTexts["scoreLabel"]
		numberBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		fizzBtn.tap()
		app.alerts["Game Over"].buttons["Play Again"].tap()
		
		numberBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		numberBtn.tap()
		buzzBtn.tap()
		buzzBtn.tap()
		
		let isLabelExists = app.alerts["Game Over"].staticTexts["Your score is 5 and high score is 3"].exists
		XCTAssertEqual(isLabelExists, true, "Label on alert shoule be updated")

		app.alerts["Game Over"].buttons["Play Again"].tap()
		XCTAssertEqual(scoreLabel.label, "Score: 0 | High Score: 5", "High score should be updated")
	}
	
	func testPlayAgainBtn() {
		let app = XCUIApplication()
		let numberBtn = app.buttons["numberBtn"]
		let fizzBtn = app.buttons["fizzBtn"]
		let playAgainBtn = app.buttons["playAgainBtn"]
		let scoreLabel = app.staticTexts["scoreLabel"]
		
		numberBtn.tap()
		numberBtn.tap()
		fizzBtn.tap()
		
		playAgainBtn.tap()
		
		app.alerts["Play Again"].buttons["OK"].tap()
		XCTAssertEqual(scoreLabel.label, "Score: 0 | High Score: 3", "High score should be recorded")
		XCTAssertEqual(numberBtn.label, "0", "Score on button should be reset after game over")
	}
}
