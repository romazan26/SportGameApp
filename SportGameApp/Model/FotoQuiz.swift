//
//  FotoQuiz.swift
//  SportGameApp
//
//  Created by Роман on 02.05.2024.
//

import Foundation

struct FotoQuiz: Identifiable{
    var id = UUID()
    
    let foto: ImageResource
    let answer: [Answer]
    
    static func getFotoQuiz() -> [FotoQuiz]{
        [
            FotoQuiz(foto: .henry, answer: [Answer(title: "Henry", isTrue: true),
                                            Answer(title: "Mbappe", isTrue: false),
                                            Answer(title: "De Bruyne", isTrue: false),
                                            Answer(title: "Salah", isTrue: false),
                                           ]),
            FotoQuiz(foto: .nedved, answer: [Answer(title: "Nedved", isTrue: true),
                                            Answer(title: "Desailly", isTrue: false),
                                            Answer(title: "De Bruyne", isTrue: false),
                                            Answer(title: "Salah", isTrue: false),
                                           ]),
            FotoQuiz(foto: .desailly, answer: [Answer(title: "Henry", isTrue: false),
                                            Answer(title: "Desailly", isTrue: true),
                                            Answer(title: "De Bruyne", isTrue: false),
                                            Answer(title: "Salah", isTrue: false),
                                           ]),
            FotoQuiz(foto: .drogba, answer: [Answer(title: "Henry", isTrue: false),
                                            Answer(title: "Mbappe", isTrue: false),
                                            Answer(title: "Drogba", isTrue: true),
                                            Answer(title: "Salah", isTrue: false),
                                           ]),
            FotoQuiz(foto: .rivaldo , answer: [Answer(title: "Henry", isTrue: false),
                                            Answer(title: "Mbappe", isTrue: false),
                                            Answer(title: "De Bruyne", isTrue: false),
                                            Answer(title: "Rivaldo", isTrue: true),
                                           ]),
            FotoQuiz(foto: .lampard, answer: [Answer(title: "Henry", isTrue: false),
                                            Answer(title: "Mbappe", isTrue: false),
                                            Answer(title: "De Bruyne", isTrue: false),
                                            Answer(title: "Lampard", isTrue: true),
                                           ]),
            FotoQuiz(foto: .devids, answer: [Answer(title: "Henry", isTrue: false),
                                            Answer(title: "Davids", isTrue: true),
                                            Answer(title: "De Bruyne", isTrue: false),
                                            Answer(title: "Salah", isTrue: false),
                                           ]),
            FotoQuiz(foto: .maldini, answer: [Answer(title: "Henry", isTrue: false),
                                            Answer(title: "Mbappe", isTrue: false),
                                            Answer(title: "Maldini", isTrue: true),
                                            Answer(title: "Salah", isTrue: false),
                                           ]),
            FotoQuiz(foto: .seedorf, answer: [Answer(title: "Henry", isTrue: false),
                                            Answer(title: "Mbappe", isTrue: false),
                                            Answer(title: "De Bruyne", isTrue: false),
                                            Answer(title: "Seedorf", isTrue: true),
                                           ]),
            FotoQuiz(foto: .cantona, answer: [Answer(title: "Henry", isTrue: false),
                                            Answer(title: "Cantona", isTrue: true),
                                            Answer(title: "De Bruyne", isTrue: false),
                                            Answer(title: "Salah", isTrue: false),
                                           ])
        ]
    }
}

