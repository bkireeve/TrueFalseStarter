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

struct Questions {
    
    var question: String
    var questionOptions: [String]
    var answer: String
    
}

struct QuestionManager {
    
    var quizQuestions: [Questions] = [
        Questions(question: "This was the only US President to serve more than two consecutive terms", questionOptions: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"], answer: "Franklin D. Roosevelt"),
        Questions(question: "Which of the following countries has the most residents?", questionOptions: ["Nigeria", "Russia", "Iran", "Vietnam"], answer: "Nigeria"),
        Questions(question: "In what year was the United Nations founded?", questionOptions: ["1918", "1919", "1945", "1954"], answer: "1945"),
        Questions(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", questionOptions: ["Paris", "Washington D.C", "New York City", "Boston"], answer: "New York City"),
        Questions(question: "Which nation produces the most oil?", questionOptions: ["Iran", "Iraq", "Brazil", "Canada"], answer: "Canada"),
        Questions(question: "Which country has the most recently won consecutive World Cups in soccer?", questionOptions: ["Italy", "Brazil", "Argentina", "Spain"], answer: "Brazil"),
        Questions(question: "Which of the following rivers is longest?", questionOptions: ["Yangtze", "Mississippi", "Congo", "Mekong"], answer: "Mississippi"),
        Questions(question: "Which city is the oldest?", questionOptions: ["Mexico City", "Cape Town", "San Juan", "Sydney"], answer: "Mexico City"),
        Questions(question: "Which country was the first to allow women to vote at national elections?", questionOptions: ["Poland", "United States", "Sweden", "Senegal"], answer: "Poland"),
        Questions(question: "Which of these countries won the most medals in the 2012 Summer Games?", questionOptions: ["France", "Germany", "Japan", "Great Britain"], answer: "Great Britain"),
        Questions(question: "Entomology is the science that studies", questionOptions: ["Behaviour of humans", "Insects", "The formation of rocks"], answer: "Insects"),
        Questions(question: "Epsom, England is the place associated with what?", questionOptions: ["Horse Racing", "Polo", "Shooting"], answer: "Horse Racing"),
        Questions(question: "When did the first human heart transplant occur?", questionOptions: ["1967", "1968", "1958"], answer: "1967"),
        Questions(question: "Galileo was an Italian astronomer who did what?", questionOptions: ["Developed the telescope", "Painted the Sistine Chapel", "Started democracy"], answer: "Developed the telescope")
    ]
    
    
    
    func randomQuestion() -> Int {
        
        let randomQ = GKRandomSource.sharedRandom().nextInt(upperBound: quizQuestions.count)
        
        return randomQ
    }
    
    mutating func uniqueRandomQuestion() -> Questions {
        let uniqueQuestion: Questions
        let randomQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: quizQuestions.count)
        uniqueQuestion = quizQuestions[randomQuestion]
        quizQuestions.remove(at: randomQuestion)
        return uniqueQuestion
    }
    
   
    
    
    
    
}






















