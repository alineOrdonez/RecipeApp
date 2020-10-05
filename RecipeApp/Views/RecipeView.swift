//
//  RecipeView.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import SwiftUI
import ImageLoader

struct RecipeView: View {
    
    @ObservedObject var viewModel = RecipeVieModel()
    
    var id: String
    var name: String
    
    
    var body: some View {
        ScrollView(.vertical) {
            if let recipe = viewModel.recipe, recipe.image.isValidURL() {
                VStack(spacing: 5) {
                    RemoteImageView(url: URL(string: recipe.image)!, placeholder: {
                        Text("Loading...")
                    })
                    .aspectRatio(contentMode: .fit)
                    HStack {
                        Text(recipe.category)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Divider()
                        Text(recipe.area)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    .aspectRatio(contentMode: .fit)
                    Spacer()
                    if let video = recipe.video, !video.isEmpty {
                        Link("Watch Video",
                             destination: URL(string: video)!)
                            .font(.title)
                            .foregroundColor(.red)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Instructions")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(recipe.instructions)
                    }
                }
            }
        }
        .navigationBarTitle(self.name, displayMode: .inline)
        .onAppear {
            self.viewModel.filterRecipesBy(id: self.id)
        }
    }
}
