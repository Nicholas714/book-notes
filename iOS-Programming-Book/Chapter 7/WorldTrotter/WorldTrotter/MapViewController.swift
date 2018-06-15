//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Nicholas Grana on 8/14/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    // this is what interface builder does in the background and why the variable is a MKMapView!
    // called whenever it comes to screen to layout the views
    override func loadView() {
        mapView = MKMapView()
        
        // sets this view controller's root node to this
        view = mapView
        
        let standardString = NSLocalizedString("Standard", comment: "Standard Map View")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite Map View")
        let hybrideString = NSLocalizedString("Hybrid", comment: "Hybrid Map View")
        
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybrideString])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0 // sets default to Standard
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // constrain the control's top anchor to the top of the safe area
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        // recommended left and right guides for the view
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // when the index changes for the segmentedControl, call the method setMapTypeChanged(_:)
        segmentedControl.addTarget(self, action: #selector(MapViewController.setMapTypeChanged(_:)), for: .valueChanged)
    }
    
    @objc func setMapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        print("MapViewController loaded its view.")
    }
    
}
