//
//  PhotoStore.swift
//  Photorama
//
//  Created by Nicholas Grana on 8/3/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import UIKit

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

enum PhotoResult {
    case success([Photo])
    case failure(Error)
}

struct PhotoStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchInterestingPhotos(completion: @escaping (PhotoResult) -> Void) {
        let url = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) -> Void in
            
            if let urlResponse = response as? HTTPURLResponse {
                print("Status Code: \(urlResponse.statusCode) Header Fields: \(urlResponse.allHeaderFields)")
            }
            
            let result = self.processPhotosRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        
        task.resume()
    }
    
    func fetchImage(for photo: Photo, completion: @escaping (ImageResult) -> Void) {
        let photoURL = photo.remoteURL
        let request = URLRequest(url: photoURL)
        
        let task = session.dataTask(with: request) { (data, response, error) -> Void in
            
            if let urlResponse = response as? HTTPURLResponse {
                print("Status Code: \(urlResponse.statusCode) Header Fields: \(urlResponse.allHeaderFields)")
            }
            
            let result = self.processImageRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        
        task.resume()
    }
    
    private func processImageRequest(data: Data?, error: Error?) -> ImageResult {
        guard let imageData = data, let image = UIImage(data: imageData) else {
            if data == nil {
                return .failure(error!)
            } else {
                return .failure(FlickrError.invalidJSONData)
            }
        }
        
        return .success(image)
    }
    
    private func processPhotosRequest(data: Data?, error: Error?) -> PhotoResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return FlickrAPI.photos(fromJSON: jsonData)
    }
    
}
