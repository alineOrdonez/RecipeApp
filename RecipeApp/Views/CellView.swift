//
//  CellView.swift
//  RecipeApp
//
//  Created by Aline Arely Ordonez Garcia on 01/10/20.
//

import SwiftUI
import ImageLoader

struct CellView: View {
    
    var image: String
    var title: String
    
    var body: some View {
        RoundedView {
            if self.image.isValidURL(), let url = URL(string: self.image) {
                RemoteImageView(url: url, placeholder: {
                    Text("Loading...")
                })
                .aspectRatio(contentMode: .fit)
            } else {
                Image(image)
            }
            VStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
        }
    }
}
