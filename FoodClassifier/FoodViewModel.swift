import AppKit

class FoodViewModel {
    let images = ["1", "2", "3", "4"]
    
    private let classifier = Classifier()
    
    func classify(image: String) -> String {
        classifier.classify(image: NSImage(named: image)!)
    }
}
