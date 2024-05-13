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
            QuizQuestion(title: "Who won the FIFA World Cup in 2018?", answer: [
                Answer(title: "France", isTrue: true),
                Answer(title: "Germany", isTrue: false),
                Answer(title: "Brazil", isTrue: false),
                Answer(title: "Spain", isTrue: false)
            ]),
            QuizQuestion(title: "Which player has won the most Ballon d'Or awards?", answer: [
                Answer(title: "Lionel Messi", isTrue: true),
                Answer(title: "Cristiano Ronaldo", isTrue: false),
                Answer(title: "Diego Maradona", isTrue: false),
                Answer(title: "Pelé", isTrue: false)
            ]),
            QuizQuestion(title: "Who is the all-time leading scorer in the history of the English Premier League?", answer: [
                Answer(title: "Alan Shearer", isTrue: true),
                Answer(title: "Wayne Rooney", isTrue: false),
                Answer(title: "Andrew Cole", isTrue: false),
                Answer(title: "Segio Aguero", isTrue: false)
            ]),
            QuizQuestion(title: "Which country has won the most Copa America titles?", answer: [
                Answer(title: "Brazil", isTrue: true),
                Answer(title: "Argentina", isTrue: false),
                Answer(title: "Uruguay", isTrue: false),
                Answer(title: "Chile", isTrue: false)
            ]),
            QuizQuestion(title: "Who is the manager of Manchester City FC?", answer: [
                Answer(title: "Pep Guardiola", isTrue: true),
                Answer(title: "Jürgen Klopp", isTrue: false),
                Answer(title: "osé Mourinho", isTrue: false),
                Answer(title: "Carlo Ancelotti", isTrue: false)
            ]),
            QuizQuestion(title: "Who is the all-time leading scorer in the history of the English Premier League?", answer: [
                Answer(title: "Alan Shearer", isTrue: true),
                Answer(title: "Wayne Rooney", isTrue: false),
                Answer(title: "Andrew Cole", isTrue: false),
                Answer(title: "Segio Aguero", isTrue: false)
            ]),
            QuizQuestion(title: "Which player has the most assists in La Liga history?", answer: [
                Answer(title: "ALionel Messi", isTrue: true),
                Answer(title: "Xavi Hernández", isTrue: false),
                Answer(title: "Andrés Iniesta", isTrue: false),
                Answer(title: "Cristiano Ronaldo", isTrue: false)
            ]),
            QuizQuestion(title: "Who is the current captain of the Brazilian national team?", answer: [
                Answer(title: "Neymar Jr.", isTrue: true),
                Answer(title: "Casemiro", isTrue: false),
                Answer(title: "Dani Alves", isTrue: false),
                Answer(title: "Thiago Silva", isTrue: false)
            ]),
            QuizQuestion(title: "Which club has won the most UEFA Champions League titles?", answer: [
                Answer(title: "Real Madrid", isTrue: true),
                Answer(title: "Barcelona", isTrue: false),
                Answer(title: "Bayern Munich", isTrue: false),
                Answer(title: "SAC Milan", isTrue: false)
            ]),
            QuizQuestion(title: "Who is the fastest player to score 100 goals in the English Premier League?", answer: [
                Answer(title: "Alan Shearer", isTrue: false),
                Answer(title: "Harry Kane", isTrue: false),
                Answer(title: "Mohamed Salah", isTrue: true),
                Answer(title: "Sergio Agüero", isTrue: false)
            ])
        ]
    }
}
struct Answer: Identifiable {
    var id = UUID()
    let title: String
    let isTrue: Bool
}
