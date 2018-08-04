//
//  AppDelegate.swift
//  Photorama
//
//  Created by Nicholas Grana on 8/3/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = window?.rootViewController as! UINavigationController
        let photosViewController = rootViewController.topViewController as! PhotosViewController
        
        photosViewController.photoStore = PhotoStore()
        
        return true
    }

}

