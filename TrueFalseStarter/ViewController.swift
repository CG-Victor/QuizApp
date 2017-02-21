//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0
    
    //Creating the labels and buttons
 
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        
        firstAnswer.layer.cornerRadius = 8
        secondAnswer.layer.cornerRadius = 8
        thirdAnswer.layer.cornerRadius = 8
        fourthAnswer.layer.cornerRadius = 8
        
        
        
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        randomQuestionGenerator()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Displays the question
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        
        let questionDictionary = trivia[indexOfSelectedQuestion]
        
        questionField.text = questionDictionary.fact
        
        firstAnswer.setTitle(questionDictionary.potentialAnswer[0], for: .normal)
        secondAnswer.setTitle(questionDictionary.potentialAnswer[1], for: .normal)
        thirdAnswer.setTitle(questionDictionary.potentialAnswer[2], for: .normal)
        fourthAnswer.setTitle(questionDictionary.potentialAnswer[3], for: .normal)
        
        
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        firstAnswer.isHidden = true
        secondAnswer.isHidden = true
        thirdAnswer.isHidden = true
        fourthAnswer.isHidden = true
       
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    
    //Making the answers shown
    //Lets user know if their answer is right or wrong
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.bestAnswer
       
        if (sender === firstAnswer && correctAnswer == 1) ||
            (sender === secondAnswer && correctAnswer == 2) ||
            (sender === thirdAnswer && correctAnswer == 3) ||
            (sender == fourthAnswer && correctAnswer == 4) {
            correctQuestions += 1
            questionField.text = "Yes! the answer is correct!"
        } else {
            questionField.text = "Nope, try again!"
        }
       
        trivia.remove(at: indexOfSelectedQuestion)
        loadNextRoundWithDelay(seconds: 2)
    }
    
    
    
    
    
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        firstAnswer.isHidden = false
        secondAnswer.isHidden = false
        thirdAnswer.isHidden = false
        fourthAnswer.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        randomQuestionGenerator()
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

