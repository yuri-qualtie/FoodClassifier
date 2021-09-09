import Foundation

class ModelDownloader {
    var modelURL: URL {
        URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent("FoodV2.mlmodelc")
    }
    private let modelPackageURL = URL(string: "https://github.com/yuri-qualtie/FoodClassifier/blob/main/Models/FoodV2.zip?raw=true")!
    
    private let fileManager = FileManager.default
    
    private var documentsDirectory: URL {
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func download() {
        let task = URLSession.shared.downloadTask(with: modelPackageURL) { location, _, _ in
            if let downloaded = location {
                let saveFile = self.documentsDirectory.appendingPathComponent("FoodV2.zip")
                
                if self.fileManager.fileExists(atPath: saveFile.path) {
                    try! self.fileManager.removeItem(at: saveFile)
                }
                
                try!  self.fileManager.moveItem(at: downloaded, to: saveFile)
                print("downloaded to: \(saveFile)")
                
            } else {
                print("fail to download")
            }
        }
        task.resume()
    }
}
