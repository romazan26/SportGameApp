//
//  Quiz.swift
//  SportGameApp
//
//  Created by Роман on 28.04.2024.
//

import Foundation

struct QuizQuestion: Identifiable {
    var id = UUID()
    
    let title: String
    let answer: [Answer]
    
    static func getQuizQuestions() -> [QuizQuestion] {
        [
            QuizQuestion(title: "Who is the all-time leading scorer in the history of the English Premier League?", answer: [
                Answer(title: "Alan Shearer", isTrue: true),
                Answer(title: "Wayne Rooney", isTrue: false),
                Answer(title: "Andrew Cole", isTrue: false),
                Answer(title: "Segio Aguero", isTrue: false)
            ])
        ]
    }
}
struct Answer: Identifiable {
    var id = UUID()
    let title: String
    let isTrue: Bool
}
