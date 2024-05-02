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
    
    @Published var simpleLighting = 0
    @Published var simplePacmen = 0
    
    @Published var quiz = QuizQuestion.getQuizQuestions()
    @Published var questionIndex = 0
    @Published var goodAnswer = 0
    @Published var win = true
    
    @Published var fotoQuiz = FotoQuiz.getFotoQuiz()
    
    @Published var priceBasket = 0
    @Published var error = ""
    
    //MARK: - CoreDate
    let container = NSPersistentContainer(name: "Shop")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
        addStore()
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
    
    func addStore(){
        let newStore = Store(context: container.viewContext)
        newStore.lighting = 0
        newStore.money = 0
        newStore.pacmen = 0
        
        saveDate()
    }
    //MARK: - Buy
    func buy(){
        if store[0].money >= Int64(priceBasket){
            store[0].money -= Int64(priceBasket)
            store[0].lighting += Int64(simpleLighting)
            store[0].pacmen += Int64(simplePacmen)
            
            saveDate()
            clean()
        } else{
            error = "Не достаточно денег"
        }
    }
    // MARK: QuizVictory
    func quizVictory(){
        if goodAnswer == quiz.count {
            win = true
        } else {
            win = false
        }
    }
    // MARK: FotoQuizVictory
    func fotoQuizVictory(){
        if goodAnswer == fotoQuiz.count {
            win = true
        } else {
            win = false
        }
    }
    
    //MARK: - Win
    func win(money: Int){
        store[0].money += Int64(money)
        saveDate()
        goodAnswer = 0
        win = false
        questionIndex = 1
    }
    
    //MARK: - Clean property
    private func clean() {
        simplePacmen = 0
        simpleLighting = 0
        priceBasket = 0
    }
}
