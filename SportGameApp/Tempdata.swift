//
//  Tempdata.swift
//  SportGameApp
//
//  Created by Роман on 01.05.2024.
//

import Foundation

final class Tempdata {
    static let shared = Tempdata()
    
    init() {}
        func getStore() -> Store{
            let store = Store()
            store.lighting = 1
            store.money = 100
            store.pacmen = 2
            
            return store
        }
    
}
