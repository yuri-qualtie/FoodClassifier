import CoreML
import AppKit

class Classifier {
    func classify(image: NSImage, modelURL: URL) -> String {
        let model = try! FoodV1(contentsOf: modelURL)
        let prediction = try! model.prediction(image: image.pixelBuffer()!)
        
        return prediction.classLabel
    }
}
