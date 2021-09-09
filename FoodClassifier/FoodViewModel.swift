import AppKit

class FoodViewModel: ObservableObject {
    let images = ["1", "2", "3", "4"]
    
    @Published var useUpdatedModel: Bool = false
    @Published var updatedModelPath: String?
    
    private let classifier = Classifier()
    private let downloader = ModelDownloader()
    
    private var modelURL: URL {
        useUpdatedModel ? downloader.modelURL : FoodV1.urlOfModelInThisBundle
    }
    
    func classify(image: String) -> String {
        classifier.classify(image: NSImage(named: image)!, modelURL: modelURL)
    }
    
    func downloadModelUpdate() {
        downloader.download { [unowned self] path in
            DispatchQueue.main.async {
                updatedModelPath = path
            }
        }
    }
}
