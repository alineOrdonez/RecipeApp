//
//  MealGridView.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import SwiftUI

struct MealGridView: View {
    
    @ObservedObject var viewModel = MealViewModel()
    
    @Binding var filter: FilterType
    @Binding var name: String
    
    @State var id: String = ""
    
    var columns = 2
    
    var body: some View {
        let gridItems = Array(repeating: GridItem(.flexible()), count: columns)
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItems) {
                if let list = self.viewModel.list {
                    ForEach(list, id: \.self) { category in
                        NavigationLink(destination: RecipeView(id: self.id, name: self.name)) {
                            CellView(image: category.image, title: category.name)
                        }
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    self.id = category.id
                                }
                        )
                    }
                }
            }
        }
        .navigationBarTitle(name, displayMode: .inline)
        .onAppear {
            self.viewModel.filterRecipesBy(self.filter, word: name)
        }
    }
}
