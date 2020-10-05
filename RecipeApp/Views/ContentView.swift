//
//  ContentView.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CategoryListView()
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("Categories")
                }
            CountryListView()
                .tabItem {
                    Image(systemName: "flag")
                    Text("Countries")
                }
        }.accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
