//
//  ImageStore.swift
//  Homepwner
//
//  Created by Nicholas Grana on 8/31/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit

class ImageStore {
    
    let cache = NSCache<NSString, UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func deleteImage(forKey key: String) {
        return cache.removeObject(forKey: key as NSString)
    }
    
}
