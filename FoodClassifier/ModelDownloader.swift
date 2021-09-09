import Foundation
import ZIPFoundation

class ModelDownloader {
    private static let fileManager = FileManager.default
    private let remoteModelPackageURL = URL(string: "https://github.com/yuri-qualtie/FoodClassifier/blob/main/Models/FoodV2.zip?raw=true")!
    
    static var documentsDirectory: URL {
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    private var zipURL: URL {
        Self.documentsDirectory
        .appendingPathComponent("FoodV2.zip")
    }

    var modelURL: URL {
        Self.documentsDirectory
            .appendingPathComponent("FoodV2.mlmodelc")
    }
    
    func download(completion: @escaping (String) -> Void) {
        removeIfExists(zipURL)
        removeIfExists(modelURL)
        
        let task = URLSession.shared.downloadTask(with: remoteModelPackageURL) { location, _, _ in
            if let downloaded = location {
                try! Self.fileManager.moveItem(at: downloaded, to: self.zipURL)
                
                try! Self.fileManager.unzipItem(at: self.zipURL, to: Self.documentsDirectory)
                completion(self.modelURL.path)
            } else {
                print("fail to download")
            }
        }
        task.resume()
    }
    
    private func removeIfExists(_ url: URL) {
        if Self.fileManager.fileExists(atPath: url.path) {
            try! Self.fileManager.removeItem(at: url)
        }
    }
}
