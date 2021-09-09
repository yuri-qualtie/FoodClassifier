import AppKit

class FoodViewModel: ObservableObject {
    let images = ["1", "2", "3", "4"]
    
    @Published var isUpdatedModelAvailable: Bool = false
    @Published var useUpdatedModel: Bool = false
    
    private let classifier = Classifier()
    private let downloader = ModelDownloader()
    
    private var modelURL: URL {
        useUpdatedModel ? downloader.modelURL : FoodV1.urlOfModelInThisBundle
    }
    
    func classify(image: String) -> String {
        classifier.classify(image: NSImage(named: image)!, modelURL: modelURL)
    }
    
    func downloadModelUpdate() {
        downloader.download()
    }
}

//https://github.com/yuri-qualtie/FoodClassifier/blob/main/Models/FoodV2.zip?raw=true
