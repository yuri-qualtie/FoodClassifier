//
//  FoodItemView.swift
//  FoodClassifier
//
//  Created by Yuri Goncharov on 09.09.2021.
//

import SwiftUI

struct FoodItemView: View {
    let image: String
    let viewModel: FoodViewModel
    
    @State var classifyResult: String?
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 150, height: 150)
            Button("Classify") {
                classifyResult = viewModel.classify(image: image)
            }
            if let result = classifyResult {
                Text(result)
            } else {
                Text("Unknown")
            }
        }
    }
}
