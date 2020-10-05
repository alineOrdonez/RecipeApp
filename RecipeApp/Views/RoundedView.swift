//
//  RoundedView.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import SwiftUI
import ImageLoader

struct RoundedView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack() {
            content
        }
        .padding()
        .background(Color(.tertiarySystemBackground))
        .cornerRadius(5)
        .transition(.move(edge: .top))
        .animation(.spring())
    }
}
