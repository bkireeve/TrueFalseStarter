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
    
    let questionsPerRound = 3
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
   
    
    var gameSound: SystemSoundID = 0
    var correctSound: SystemSoundID = 1
    var incorrectSound: SystemSoundID = 2
    
    var questionManager = QuestionManager()
    var questions: Questions = Questions(question: "", questionOptions: [""], answer: "")
    
    var timer = Timer()
    var timeDuration = 15
    var indexProgressBar = 0
    
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answerField: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var timerProgressBar: UIProgressView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        loadCorrectResponseSound()
        loadWrongResponseSound()
        // Start game
        playGameStartSound()
        displayQuestion()
        // Set timer
        timerProgressBar.progress = 0.0
        startTimer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        indexProgressBar = 0
        questions = questionManager.uniqueRandomQuestion() //store random question in variable
        
        questionField.text = questions.question
        questionField.textColor = UIColor.white
        answerField.isHidden = true
        playAgainButton.isHidden = true
        
        // Assign question options to buttons
        let answerArray = questions.questionOptions.count
        
        if answerArray == 4 {
            option1.setTitle(questions.questionOptions[0], for: .normal)
            option2.setTitle(questions.questionOptions[1], for: .normal)
            option3.setTitle(questions.questionOptions[2], for: .normal)
            option4.setTitle(questions.questionOptions[3], for: .normal)
            option4.isHidden = false
        }
        else if answerArray == 3 {
            option1.setTitle(questions.questionOptions[0], for: .normal)
            option2.setTitle(questions.questionOptions[1], for: .normal)
            option3.setTitle(questions.questionOptions[2], for: .normal)
            option4.isHidden = true
        }
    }
    

    func displayScore() {
        timer.invalidate()
        
        
        // Hide the answer buttons
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        // Establish answer and check what option is pressed
        let correctAnswer = questions.answer
        let answerArray = questions.questionOptions.count
        
        if answerArray == 4 {
        
        if sender === option1 && option1.titleLabel?.text == correctAnswer || sender === option2 && option2.titleLabel?.text == correctAnswer || sender === option3 && option3.titleLabel?.text == correctAnswer || sender === option4 && option4.titleLabel?.text == correctAnswer
            {
                correctQuestions += 1
                questionField.text = "That's Correct!"
                questionField.textColor = UIColor.green
                playCorrectResponseSound()
                
            }
            else
            {
                answerField.isHidden = false
                questionField.text = "Sorry, that's wrong!"
                questionField.textColor = UIColor.orange
                answerField.font = UIFont(name: "Thonburi", size: 15)
                answerField.text = "It's \(correctAnswer)!"
                answerField.textColor = UIColor.orange
                playWrongResponseSound()
                
            }
            
        } else if answerArray == 3 {
            
            if sender === option1 && option1.titleLabel?.text == correctAnswer || sender === option2 && option2.titleLabel?.text == correctAnswer || sender === option3 && option3.titleLabel?.text == correctAnswer
            {
                correctQuestions += 1
                questionField.text = "That's Correct!"
                questionField.textColor = UIColor.green
                playCorrectResponseSound()
            }
            else
            {
                answerField.isHidden = false
                questionField.text = "Sorry, that's wrong!"
                questionField.textColor = UIColor.orange
                answerField.font = UIFont(name: "Thonburi", size: 15)
                answerField.text = "It's \(correctAnswer)!"
                answerField.textColor = UIColor.orange
                playWrongResponseSound()
                
            }
            
        }
        // End timer
        timer.invalidate()
        
        // Load next question
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
        option1.isHidden = false
        option2.isHidden = false
        option3.isHidden = false
        option4.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
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
    
    // MARK: Sound Methods
    
    func loadGameStartSound() {
        if let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav") {
            let soundURL = URL(fileURLWithPath: pathToSoundFile)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
        }
    }
    
    func loadCorrectResponseSound() {
        if let pathToSoundFile = Bundle.main.path(forResource: "CorrectAnswer", ofType: "wav") {
            let soundURL = URL(fileURLWithPath: pathToSoundFile)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctSound)
        }
    }
    
    func loadWrongResponseSound() {
        if let pathToSoundFile = Bundle.main.path(forResource: "wrongAnswer", ofType: "wav") {
            let soundURL = URL(fileURLWithPath: pathToSoundFile)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &incorrectSound)
        }
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func playCorrectResponseSound() {
        AudioServicesPlaySystemSound(correctSound)
    }
    
    func playWrongResponseSound() {
        AudioServicesPlaySystemSound(incorrectSound)
    }
    
    // MARK: Timer Methods
    
    func startTimer() {
        
            var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setProgressBar), userInfo: nil, repeats: true)
        
    }
    
    
    func setProgressBar() {
        if indexProgressBar < timeDuration {
            indexProgressBar += 1
            timerProgressBar.progress = Float(indexProgressBar) / Float(timeDuration)
            
        } else if indexProgressBar == timeDuration {
            answerField.isHidden = true
            questionField.text = "Sorry, out of time!"
            questionField.textColor = UIColor.orange
            answerField.font = UIFont(name: "Thonburi", size: 15)
            answerField.textColor = UIColor.orange
            questionsAsked += 1
            timer.invalidate()
            loadNextRoundWithDelay(seconds: 2)
            indexProgressBar = 0
            
        }
        
    }
}














