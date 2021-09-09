//
//  FoodItemView.swift
//  FoodClassifier
//
//  Created by Yuri Goncharov on 09.09.2021.
//

import SwiftUI

struct FoodItemView: View {
    let image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 150, height: 150)
            Button("Classify") {
                print("some")
            }
            Text("Result")
        }
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(image: "1")
    }
}
