//
//  CategoryListView.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import SwiftUI
import ImageLoader

struct CategoryListView: View {
    
    @ObservedObject var viewModel = CategoryListViewModel()
    
    @State var filter = FilterType.category
    @State var categoryName: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    if let list = self.viewModel.list {
                        ForEach(list, id: \.self) { category in
                            NavigationLink(destination: MealGridView(filter: self.$filter,
                                                                     name: self.$categoryName)) {
                                CellView(image: category.image, title: category.name)
                            }
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded { _ in
                                        self.categoryName = category.name
                                    }
                            )
                        }
                    }
                }
            }
            .navigationTitle("Categories")
        }
        .onAppear {
            self.viewModel.getAllCategories()
        }
    }
}
