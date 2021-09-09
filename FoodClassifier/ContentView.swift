//
//  ContentView.swift
//  FoodClassifier
//
//  Created by Yuri Goncharov on 09.09.2021.
//

import SwiftUI

struct ContentView: View {
    let images = ["1", "2", "3", "4"]
    
    var body: some View {
        HStack {
            ForEach(images, id:\.self) {
                FoodItemView(image: $0)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
