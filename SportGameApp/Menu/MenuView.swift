//
//  MenuView.swift
//  SportGameApp
//
//  Created by Роман on 24.04.2024.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @AppStorage("noUser") var noUser: Bool?
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                Color(.backGround)
                Image(.ball)
                    .resizable()
                    .frame(width: 347, height: 393)
                    .padding(.top, 345)
                    .padding(.leading,197)
                VStack {
                    //MARK: - Title
                    Text("MENU")
                        .foregroundStyle(.white)
                        .font(.system(size: 41,weight: .bold))
                        .padding(.top, 160)
                    
                    //MARK: - Games button
                    NavigationLink {
                        GamesView(viewModel: viewModel)
                    } label: {ButtonMenu(text: "GAMES", icon: "gamecontroller.fill")}
                    .padding(.top, 40)
                    
                    //MARK: - Bonus Game button
                    NavigationLink {
                        BonusGameView(viewModel: viewModel)
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundStyle(.colorButton)
                                .frame(width: 331, height: 80)
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.white)
                                Text("BONUS GAME")
                                    .foregroundStyle(.white)
                                    .font(.system( size: 34, weight: .bold))
                            }
                        }
                    }
                    
                    //MARK: - Shop button
                    NavigationLink {
                        ShopView(viewModel: viewModel)
                    } label: {
                        ButtonMenu(text: "SHOP", icon: "cart.fill")
                    }
                    
                    Spacer()
                    
                    //MARK: - Setting button
                    NavigationLink {
                        SettingsView()
                    } label: {
                        ButtonMenu(text: "SETTINGS", icon: "gear")
                            .padding(.bottom, 55)
                    }

                    
                    
                }
                
                
            }.ignoresSafeArea()
              
        }
        
       
        .onAppear(perform: {
            if !(noUser ?? false) {
                viewModel.addStore()
                noUser = true
            }
        })
        
    }
}

#Preview {
    MenuView()
}

extension View {

  func navigationBarBackButtonTitleHidden() -> some View {
    self.modifier(NavigationBarBackButtonTitleHiddenModifier())
  }
}

struct NavigationBarBackButtonTitleHiddenModifier: ViewModifier {

  @Environment(\.dismiss) var dismiss

  @ViewBuilder @MainActor func body(content: Content) -> some View {
    content
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(
        leading: Button(action: { dismiss() }) {
          Image(systemName: "chevron.left")
            .foregroundColor(.white)
          .imageScale(.large) })
      .contentShape(Rectangle()) // Start of the gesture to dismiss the navigation
      .gesture(
        DragGesture(coordinateSpace: .local)
          .onEnded { value in
            if value.translation.width > .zero
                && value.translation.height > -30
                && value.translation.height < 30 {
              dismiss()
            }
          }
      )
  }
}
