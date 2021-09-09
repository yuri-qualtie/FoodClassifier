//
//  ContentView.swift
//  FoodClassifier
//
//  Created by Yuri Goncharov on 09.09.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FoodViewModel()
    
    var body: some View {
        VStack {
            HStack {
                ForEach(viewModel.images, id:\.self) {
                    FoodItemView(image: $0, viewModel: viewModel)
                }
            }
            Divider()
            HStack {
                Button("Download Model Update", action: viewModel.downloadModelUpdate)
                if viewModel.updatedModelPath != nil {
                    Toggle("Use Updated Model", isOn: $viewModel.useUpdatedModel)
                }
            }
            if let path = viewModel.updatedModelPath {
                HStack {
                    Text("Downloaded to: \(path)").fixedSize()
                    Button("Open in Finder") {
                        NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: ModelDownloader.documentsDirectory.path)
                    }
                }
            }
        }
        .padding()
    }
}
