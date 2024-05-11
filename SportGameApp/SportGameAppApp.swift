//
//  SportGameAppApp.swift
//  SportGameApp
//
//  Created by Роман on 23.04.2024.
//

import SwiftUI

@main
struct SportGameAppApp: App {
    
    @AppStorage("isFirstStart") var isFirstStart: Bool = true
    @AppStorage("noUser") var noUser: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isFirstStart {
                WelcomeView()
            }else {
                LoadingView()
            }
        }
    }
}
