//
//  Game.swift
//  FizzBuzzTDDSwift
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/4/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation

class Game {
	
	let brain = Brain()
	var score = 0
	
	public func play(_ move: String) -> Bool{
		let result = brain.checkNumber(score+1) == move
		if result {
			score += 1
		}
		return result
	}
}
