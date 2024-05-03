//
//  ViewModel.swift
//  SportGameApp
//
//  Created by Роман on 29.04.2024.
//

import CoreData
import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var store: [Store]!
    
    @Published var simpleLighting = 0
    @Published var simplePacmen = 0
    
    @Published var quiz = QuizQuestion.getQuizQuestions()
    @Published var questionIndex = 0
    @Published var goodAnswer = 0
    @Published var win = true
    @Published var choisOn = false
    
    @Published var fotoQuiz = FotoQuiz.getFotoQuiz()
    @Published var color = false
    @Published var color1 = false
    @Published var color2 = false
    @Published var color3 = false
    @Published var color4 = false
    
    @Published var trueFalseGame = TrueFalse.getTrueFalseGame()
    @Published var isDelete1 = false
    @Published var isDelete2 = false
    @Published var isDelete3 = false
    @Published var isDelete4 = false
    
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
    //MARK: - CheckColor
    func checkColor(){
        if !choisOn{
            color = true
            choisOn = true
        }
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
        if goodAnswer >= quiz.count {
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
        choisOn = true
        questionIndex = 0
        choisOn = false
        color = false
        color1 = false
        color2 = false
        color3 = false
        color4 = false
    }
    
    //MARK: - Clean property
    private func clean() {
        simplePacmen = 0
        simpleLighting = 0
        priceBasket = 0
    }
    
    //MARK: - IsDelete
    func deleteOneTF(){
        if !trueFalseGame[questionIndex].isTrue {
            isDelete1 = true
        }else {
            isDelete2 = true
        }
        store[0].pacmen -= 1
    }
    
    func deleteOneQuiz(){
        var index = 1
        for answer in quiz[questionIndex].answer {
            if !answer.isTrue {
                switch index {
                    
                case 1: isDelete1 = true
                case 2: isDelete2 = true
                case 3: isDelete3 = true
                default:
                    isDelete4 = true
                }
            }
            index += 1
        }
    }
    //MARK: - Next Level
    func nextLevel(){
        choisOn = false
        color = false
        color1 = false
        color2 = false
        color3 = false
        color4 = false
        isDelete1 = false
        isDelete2 = false
    }
}
