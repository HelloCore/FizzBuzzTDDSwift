//
//  ViewController.swift
//  FizzBuzzTDDSwift
//
//  Created by AKKHARAWAT CHAYAPIWAT on 1/4/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var scoreLabel: UILabel!
	
	@IBOutlet weak var numberBtn: UIButton!
	@IBOutlet weak var campaignBtn: UIButton!
	@IBOutlet weak var lightingBtn: UIButton!
	@IBOutlet weak var rocketBtn: UIButton!
	@IBOutlet weak var playAgainBtn: UIButton!
	
	var gameScore: Int = 0 {
		didSet {
			numberBtn.setTitle("\(gameScore)", for: .normal)
			scoreLabel.text = "Score: \(gameScore) | High Score: \(highScore)"
		}
	}
	
	var game: Game?
	var highScore: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		game = Game()
		newGame()
	}
	
	func newGame() {
		if gameScore > highScore {
			highScore = gameScore
		}
		gameScore = 0
		game?.restart()
	}
	
	func clearGame() {
		highScore = 0
		gameScore = 0
		game?.restart()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	public func play(_ move: Move) {
		guard let unwrapGame = game else {
			print("game is nil")
			return
		}
		let response = unwrapGame.play(move)
		if response.isRight {
			gameScore = response.score
		} else {
			let alertController = UIAlertController(title: "Game Over", message: "Your score is \(gameScore) and high score is \(highScore)", preferredStyle: .alert)
			alertController.addAction(UIAlertAction(title: "Play Again", style: .default) { [unowned self] _ in
				self.newGame()
			})
			present(alertController, animated: true)
		}
	}
	
	@IBAction func mainBtnClick(_ sender: UIButton) {
		switch sender {
			case numberBtn:
				play(.number)
			case campaignBtn:
				play(.fizz)
			case lightingBtn:
				play(.buzz)
			case rocketBtn:
				play(.fizzBuzz)
			default:
				break
		}
	}
	
	@IBAction func playAgainClick(_ sender: Any) {
		let alertController = UIAlertController(title: "Play Again", message: "Do you want to restart game?", preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
			self.newGame()
		})
		alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		present(alertController, animated: true)
	}
	
	@IBAction func clearButtonClick(_ sender: Any) {
		clearGame()
	}
}

