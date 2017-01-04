//
//  Brain.swift
//  FizzBuzzTDDSwift
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/4/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation

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
	
	public func checkNumber(_ number: Int) -> String {
		let result: String
		switch number {
			case 0:
				result = "0"
			case _ where isDividedByFifteen(number):
				result = "FizzBuzz"
			case _ where isDividedByFive(number):
				result = "Buzz"
			case _ where isDividedByThree(number):
				result = "Fizz"
			default:
				result = "\(number)"
		}
		return result
	}
}
