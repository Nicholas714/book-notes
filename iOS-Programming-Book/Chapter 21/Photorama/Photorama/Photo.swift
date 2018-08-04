//
//  Photo.swift
//  Photorama
//
//  Created by Nicholas Grana on 8/3/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import Foundation

class Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, remoteURL: URL, photoID: String, dateTaken: Date) {
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
    
}

extension Photo: Equatable {
    
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.photoID == rhs.photoID
    }
    
}
