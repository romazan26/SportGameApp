//
//  BlurView.swift
//  SportGameApp
//
//  Created by Роман on 30.04.2024.
//

import SwiftUI

struct BlurUIView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect:UIBlurEffect(style: style))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
  
}
