//
//  QuestionManager.swift
//  TrueFalseStarter
//
//  Created by Bogdan Kireeve on 25/12/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import GameKit

/// QuestionManager defines how the quiz will work

struct Question {
    
    var question: String
    var questionOptions: [String]
    var answer: String
    
}

struct QuestionManager {
    
    var quizQuestions: [Question] = [
        Question(question: "This was the only US President to serve more than two consecutive terms", questionOptions: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"], answer: "Franklin D. Roosevelt"),
        Question(question: "Which of the following countries has the most residents?", questionOptions: ["Nigeria", "Russia", "Iran", "Vietnam"], answer: "Nigeria"),
        Question(question: "In what year was the United Nations founded?", questionOptions: ["1918", "1919", "1945", "1954"], answer: "1945"),
        Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", questionOptions: ["Paris", "Washington D.C", "New York City", "Boston"], answer: "New York City"),
        Question(question: "Which nation produces the most oil?", questionOptions: ["Iran", "Iraq", "Brazil", "Canada"], answer: "Canada"),
        Question(question: "Which country has the most recently won consecutive World Cups in soccer?", questionOptions: ["Italy", "Brazil", "Argentina", "Spain"], answer: "Brazil"),
        Question(question: "Which of the following rivers is longest?", questionOptions: ["Yangtze", "Mississippi", "Congo", "Mekong"], answer: "Mississippi"),
        Question(question: "Which city is the oldest?", questionOptions: ["Mexico City", "Cape Town", "San Juan", "Sydney"], answer: "Mexico City"),
        Question(question: "Which country was the first to allow women to vote at national elections?", questionOptions: ["Poland", "United States", "Sweden", "Senegal"], answer: "Poland"),
        Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", questionOptions: ["France", "Germany", "Japan", "Great Britain"], answer: "Great Britain"),
        Question(question: "Entomology is the science that studies", questionOptions: ["Behaviour of humans", "Insects", "The formation of rocks"], answer: "Insects"),
        Question(question: "Epsom, England is the place associated with what?", questionOptions: ["Horse Racing", "Polo", "Shooting"], answer: "Horse Racing"),
        Question(question: "When did the first human heart transplant occur?", questionOptions: ["1967", "1968", "1958"], answer: "1967"),
        Question(question: "Galileo was an Italian astronomer who did what?", questionOptions: ["Developed the telescope", "Painted the Sistine Chapel", "Started democracy"], answer: "Developed the telescope")
    ]
    
    
    
    func randomQuestion() -> Int {
        
        let randomQ = GKRandomSource.sharedRandom().nextInt(upperBound: quizQuestions.count)
        
        return randomQ
    }
    
    mutating func uniqueRandomQuestion() -> Question {
        let uniqueQuestion: Question
        let randomQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: quizQuestions.count)
        uniqueQuestion = quizQuestions[randomQuestion]
        quizQuestions.remove(at: randomQuestion)
        return uniqueQuestion
    }
    
   
    
    
    
    
}






















