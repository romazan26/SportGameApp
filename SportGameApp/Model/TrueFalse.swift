//
//  TrueFalse.swift
//  SportGameApp
//
//  Created by Роман on 03.05.2024.
//

import Foundation

struct TrueFalse: Identifiable {
    let id = UUID()
    let title: String
    let isTrue: Bool
    
    static func getTrueFalseGame() -> [TrueFalse]{
        [TrueFalse(title: "We all know that Blackburn lifted the trophy early on, but did that success come in the 1992/93 season?",
                   isTrue: true),
         TrueFalse(title: "The Andorran national team has never won a friendly match", 
                   isTrue: false),
         TrueFalse(title: "Danny has scored more goals in his career than have been scored in the highest-scoring football match",
                   isTrue: false),
         TrueFalse(title: "Is it true that the five-time Belize football champion is a team of bandits",
                   isTrue: true),
         TrueFalse(title: "Manchester United was founded before Manchester City",
                   isTrue: false),
         TrueFalse(title: "Fiorentina football club sold air to its fans",
                   isTrue: true),
         TrueFalse(title: "Football was banned in England for over 200 years",
                   isTrue: true),
         TrueFalse(title: "The penalty kick was introduced into football by Irish referee John McPenalty.",
                   isTrue: false),
         TrueFalse(title: "The Ole-Ole charge is a kind of prayer",
                   isTrue: false),
         TrueFalse(title: "David Villa managed to score from the center of the field",
                   isTrue: true)
         ]
    }
}
