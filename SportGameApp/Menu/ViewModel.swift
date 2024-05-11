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
    
    //MARK: - Propertys
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
    
    @Published var degrees: Double = 0
    @Published var bonus = Image(.energy1)
    @Published var dateStartTimer = Date()
    @Published var startTimer = false
    
    //MARK: - StartTimer

    func checkTimer(minute: Int, second: Int){
        if store[0].freeSpinDate == nil {
            store[0].freeSpinDate = Date()
            saveDate()
            print("Date save")
        }
        if minute <= 0 && second <= 0{
            store[0].spin += 1
            store[0].freeSpinDate = Date()
            dateStartTimer = store[0].freeSpinDate ?? Date()
            saveDate()
            print(dateStartTimer)
        }
    }
    
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
        newStore.spin = 1
        
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
        nextLevel()
        goodAnswer = 0
        win = false
        questionIndex = 0
        
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
        saveDate()
    }
    
    func deleteOneQuiz(){
        var index = 0
        for answer in quiz[questionIndex].answer {
            index += 1
            if !answer.isTrue {
                if index == 1 && !isDelete1 {
                    isDelete1 = true
                    index = 5
                }
                if index == 2 && !isDelete2{
                    isDelete2 = true
                    index = 5
                }
                if index == 3 && !isDelete3{
                    isDelete3 = true
                    index = 5
                }
                if index == 4 && !isDelete4{
                    isDelete4 = true
                    index = 5
                }
            }
        }
    }
    func deleteOneFoto(){
        var index = 0
        for answer in fotoQuiz[questionIndex].answer {
            index += 1
            if !answer.isTrue {
                if index == 1 && !isDelete1 {
                    isDelete1 = true
                    index = 5
                }
                if index == 2 && !isDelete2{
                    isDelete2 = true
                    index = 5
                }
                if index == 3 && !isDelete3{
                    isDelete3 = true
                    index = 5
                }
                if index == 4 && !isDelete4{
                    isDelete4 = true
                    index = 5
                }
            }
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
        isDelete3 = false
        isDelete4 = false
    }
    
    //MARK: - BonusGame
    func findBonus(){
        degrees = Double.random(in: 360...720)
        let position = degrees - 360
        switch position {
        case 0...45 :  bonus = Image(.energy1)
        case 45...90 :   bonus = Image(.pacman2)
        case 90...135 :  bonus = Image(.pacman1)
        case 135...180 :  bonus = Image(.energy2)
        case 180...225 :  bonus = Image(.energy1)
        case 225...270 :  bonus = Image(.pacman3)
        case 270...315 :  bonus = Image(.energy4)
        default:
            bonus = Image(.pacman4)
        }
        store[0].spin -= 1
        saveDate()
        
    }
    
    func collctBonus(){
        switch bonus{
        case Image(.energy1): store[0].lighting += 1
        case Image(.energy2): store[0].lighting += 2
        case Image(.energy4): store[0].lighting += 4
        case Image(.pacman1): store[0].pacmen += 1
        case Image(.pacman2): store[0].pacmen += 2
        case Image(.pacman3): store[0].pacmen += 3
        case Image(.pacman4): store[0].pacmen += 4
        default:
            break
        }
        saveDate()
    }
    func buySpin(){
        if store[0].money > 99 {
            store[0].money -= 100
            store[0].spin += 1
        }
        saveDate()
    }
}
