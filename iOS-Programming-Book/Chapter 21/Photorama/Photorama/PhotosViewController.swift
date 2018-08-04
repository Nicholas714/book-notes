//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Nicholas Grana on 8/3/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    var photoStore: PhotoStore!
    
    let photoDataStore = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = photoDataStore
        collectionView.delegate = self
        
        photoStore.fetchInterestingPhotos { photoResult in
            switch photoResult {
            case .success(let photos):
                print("Successfully found \(photos.count) photos.")
                
                self.photoDataStore.photos = photos
            case .failure(let error):
                print("error fetching interesting photos: \(error)")
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showPhoto"?:
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                let photo = photoDataStore.photos[selectedIndexPath.row]
                
                let desintationVC = segue.destination as! PhotoInfoViewController
                desintationVC.photo = photo
                desintationVC.photoStore = photoStore
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}

extension PhotosViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let photo = photoDataStore.photos[indexPath.row]
        
        photoStore.fetchImage(for: photo) { (result) in
            
            guard let photoIndex = self.photoDataStore.photos.index(of: photo), case let .success(image) = result else {
                return
            }
            
            let photoIndexPath = IndexPath(row: photoIndex, section: 0)
            
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                cell.update(with: image)
            }
            
        }
    }
    
}
