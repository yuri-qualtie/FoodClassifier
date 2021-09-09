
import Foundation

class ModelDownloader {
    var modelURL: URL {
        URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent("FoodV2.mlmodelc")
    }
}
