//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Nicholas Grana on 8/4/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var photoStore: PhotoStore!
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoStore.fetchImage(for: photo) { (result) in
            switch result {
            case .success(let image):
                self.imageView.image = image
            case .failure(let error):
                print("Error fetching image for photo: \(error)")
            }
        }
    }
    
}
