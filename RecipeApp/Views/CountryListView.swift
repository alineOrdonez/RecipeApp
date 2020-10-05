//
//  CountryListView.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import SwiftUI

struct CountryListView: View {
    @ObservedObject var viewModel = CountryListViewModel()
    
    @State var filter = FilterType.area
    @State var country: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    if let list = self.viewModel.list {
                        ForEach(list, id: \.self) { area in
                            NavigationLink(destination: MealGridView(filter: self.$filter,
                                                                     name: self.$country)) {
                                CellView(image: area.name, title: area.name)
                            }
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded { _ in
                                        self.country = area.name
                                    }
                            )
                        }
                    }
                }
            }
            .navigationTitle("Countries")
        }
        .onAppear {
            self.viewModel.getAllAreas()
        }
    }
}
