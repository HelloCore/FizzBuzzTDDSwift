//
//  FizzBuzzTDDSwiftKIFTests.swift
//  FizzBuzzTDDSwiftKIFTests
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/3/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import XCTest
import KIF

extension XCTestCase {
	func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
		return KIFUITestActor(inFile: file, atLine: line, delegate: self)
	}
	
	func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
		return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
	}
}

extension KIFTestActor {
	func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
		return KIFUITestActor(inFile: file, atLine: line, delegate: self)
	}
	
	func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
		return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
	}
}

class FizzBuzzTDDSwiftKIFTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
		
		tester().tapView(withAccessibilityIdentifier: "clearBtn")
    }
    
	
	func testTabButtonNumberButtonIncreased() {
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "numberBtn"), toContainText: "1")
	}
	
	func testTabButtonScoreIncreased() {
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "scoreLabel"), toContainText: "Score: 1 | High Score: 0")
	}
	
	func testTabWrongButtonScoreNotIncreased() {
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityLabel: "Play Again")
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "scoreLabel"), toContainText: "Score: 0 | High Score: 0")
	}
	
	func testPlayToFizz() {
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "scoreLabel"), toContainText: "Score: 3 | High Score: 0")
	}
	
	func testPlayToBuzz() {
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "buzzBtn")
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "scoreLabel"), toContainText: "Score: 5 | High Score: 0")
	}
	
	func testPlayToFizzBuzz() {
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "buzzBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityIdentifier: "buzzBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBuzzBtn")
		
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "scoreLabel"), toContainText: "Score: 15 | High Score: 0")
	}
	
	func testPlayToGameOverFirstTime() {
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().waitForView(withAccessibilityLabel: <#T##String!#>, value: <#T##String!#>, traits: <#T##UIAccessibilityTraits#>)
		tester().waitForView(withAccessibilityLabel: "Your score is 3 and high score is 0")
		
		tester().tapView(withAccessibilityLabel: "Play Again")
		
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "scoreLabel"), toContainText: "Score: 0 | High Score: 3")
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "numberBtn"), toContainText: "0")
		
	}
	
	func testPlayToGameOverSecondTime() {
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		
		tester().tapView(withAccessibilityLabel: "Play Again")
		
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "buzzBtn")
		tester().tapView(withAccessibilityIdentifier: "buzzBtn")
		
		tester().waitForView(withAccessibilityLabel: "Your score is 5 and high score is 3")
		tester().tapView(withAccessibilityLabel: "Play Again")
		
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "scoreLabel"), toContainText: "Score: 0 | High Score: 5")
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "numberBtn"), toContainText: "0")

	}
	
	func testPlayAgainBtn() {
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "numberBtn")
		tester().tapView(withAccessibilityIdentifier: "fizzBtn")
		
		tester().tapView(withAccessibilityIdentifier: "playAgainBtn")
		
		tester().tapView(withAccessibilityLabel: "OK")
		
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "scoreLabel"), toContainText: "Score: 0 | High Score: 3")
		tester().expect(tester().waitForView(withAccessibilityIdentifier: "numberBtn"), toContainText: "0")

	}
}
