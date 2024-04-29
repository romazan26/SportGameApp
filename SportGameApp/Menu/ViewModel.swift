//
//  ViewModel.swift
//  SportGameApp
//
//  Created by Роман on 29.04.2024.
//

import CoreData
import Foundation

final class ViewModel: ObservableObject {
    @Published var store: [Store]!
    
    @Published var simpleMoney = 0
    @Published var simpleLighting = 0
    @Published var simplePacmen = 0
    
    @Published var quiz = QuizQuestion.getQuizQuestions()
    @Published var questionIndex = 0
    
    @Published var priceBasket = 0
    
    //MARK: - CoreDate
    let container = NSPersistentContainer(name: "Shop")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
        fetchShop()
    }
    
    func fetchShop() {
        let request = NSFetchRequest<Store>(entityName: "Store")
        
        do {
            store = try container.viewContext.fetch(request)
        }catch let error {
            print("Error fetching \(error)")
        }
    }
    
    func saveDate() {
        do {
            try container.viewContext.save()
            fetchShop()
        }catch let error {
            print("Error save: \(error)")
        }
    }
}
