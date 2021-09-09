import CoreML
import AppKit

class Classifier {
    let model = FoodV1()

    func classify(image: NSImage) -> String {
        let prediction = try! model.prediction(image: image.pixelBuffer()!)
        
        return prediction.classLabel
    }
}
