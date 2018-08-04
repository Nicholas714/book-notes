//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Nicholas Grana on 8/3/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var photoStore: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoStore.fetchInterestingPhotos { photoResult in
            switch photoResult {
            case .success(let photos):
                print("Successfully found \(photos.count) photos.")
                
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case .failure(let error):
                print("error fetching interesting photos: \(error)")
            }
        }
    }
    
    func updateImageView(for photo: Photo) {
        photoStore.fetchImage(for: photo) { imageResult in
            
            switch imageResult {
            case .success(let image):
                self.imageView.image = image
            case .failure(let error):
                print("Error downloading image: \(error)")
            }
            
        }
    }
    
}
