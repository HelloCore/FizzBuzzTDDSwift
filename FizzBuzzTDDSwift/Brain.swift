//
//  Brain.swift
//  FizzBuzzTDDSwift
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/4/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation

enum Move {
	case number
	case fizzBuzz
	case buzz
	case fizz
}

class Brain {
	
	public func isDividedByThree(_ number: Int) -> Bool {
		return isDividedNumber(number, by: 3)
	}
	
	public func isDividedByFive(_ number: Int) -> Bool {
		return isDividedNumber(number, by: 5)
	}
	
	public func isDividedByFifteen(_ number: Int) -> Bool {
		return isDividedNumber(number, by: 15)
	}
	
	public func isDividedNumber(_ number: Int,by divisor: Int) -> Bool {
		return number % divisor == 0
	}
	
	public func checkNumber(_ number: Int) -> Move {
		let result: Move
		switch number {
			case 0:
				result = .number
			case _ where isDividedByFifteen(number):
				result = .fizzBuzz
			case _ where isDividedByFive(number):
				result = .buzz
			case _ where isDividedByThree(number):
				result = .fizz
			default:
				result = .number
		}
		return result
	}
}
