//
//  SportGameAppApp.swift
//  SportGameApp
//
//  Created by Роман on 23.04.2024.
//

import SwiftUI

@main
struct SportGameAppApp: App {
    @AppStorage("isFirstStart") var isFirstStart: Bool = false
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
