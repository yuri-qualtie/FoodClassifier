//
//  ContentView.swift
//  FoodClassifier
//
//  Created by Yuri Goncharov on 09.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = FoodViewModel()
    
    var body: some View {
        HStack {
            ForEach(viewModel.images, id:\.self) {
                FoodItemView(image: $0, viewModel: viewModel)
            }
        }
        .padding()
    }
}
