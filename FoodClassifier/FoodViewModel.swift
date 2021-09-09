import AppKit

class FoodViewModel: ObservableObject {
    let images = ["1", "2", "3", "4"]
    
    @Published var isUpdatedModelAvailable: Bool = false
    @Published var useUpdatedModel: Bool = true
    
    private let classifier = Classifier()
    private let downloader = ModelDownloader()
    
    private var modelURL: URL {
        isUpdatedModelAvailable ? downloader.modelURL : FoodV1.urlOfModelInThisBundle
    }
    
    func classify(image: String) -> String {
        classifier.classify(image: NSImage(named: image)!, modelURL: modelURL)
    }
    
    func downloadModelUpdate() {
        print(NSTemporaryDirectory())
        isUpdatedModelAvailable = true
    }
}
