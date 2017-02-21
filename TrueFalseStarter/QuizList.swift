//
//  QuestionList.swift
//  TrueFalseStarter
//
//  Created by Chris Gonzaga on 2/20/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

//Struct is form to collect question data
struct Quiz {
    let fact: String
    let potentialAnswer: [String]
    let bestAnswer: Int
}




var quizCollection: [Quiz] = [
    Quiz(fact: "This was the only US President to serve more than two consecutive terms", potentialAnswer: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"], bestAnswer: 2),
    Quiz(fact: "Which of the following countries has the most residents?", potentialAnswer: ["Nigeria", "Russia", "Iran", "Vietnam"], bestAnswer: 1),
    Quiz(fact: "In what year was the United Nations founded?", potentialAnswer: ["1918", "1919", "1945", "1954"], bestAnswer: 3),
    Quiz(fact: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", potentialAnswer: ["Paris", "Washington D.C.", "New York City", "Boston"], bestAnswer: 3),
    Quiz(fact: "Which nation produces the most oil?", potentialAnswer: ["Iran", "Iraq", "Brazil", "Canada"], bestAnswer: 4),
    Quiz(fact: "Which country has most recently won consecutive World Cups in Soccer?", potentialAnswer: ["Italy", "Brazil", "Argetina", "Spain"], bestAnswer: 2),
    Quiz(fact: "Which of the following rivers is longest?", potentialAnswer: ["Yangtze", "Mississippi", "Congo", "Mekong"], bestAnswer: 2),
    Quiz(fact: "Which city is the oldest?", potentialAnswer: ["Mexico City", "Cape Town", "San Juan", "Sydney"], bestAnswer: 1),
    Quiz(fact: "Which country was the first to allow women to vote in national elections?", potentialAnswer: ["Poland", "United States", "Sweden", "Senegal"], bestAnswer: 1),
    Quiz(fact: "Which of these countries won the most medals in the 2012 Summer Games?", potentialAnswer: ["France", "Germany", "Japan", "Great Britian"], bestAnswer: 4)
]


//Shows the question for the screen

var trivia: [Quiz] = []

func randomQuestionGenerator() {
    trivia = []
    for question in quizCollection {
        trivia.append(question)
    }
}


