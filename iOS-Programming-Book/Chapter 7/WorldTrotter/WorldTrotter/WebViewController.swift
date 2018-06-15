//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Nicholas Grana on 8/15/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit
import WebKit

// SILVER CHALLENGE: Make a WebViewController and add to Tab Bar to load bignerdranch.com
class WebViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        
        view = webView
        
        let bigNerdRanch = URL(string: "https://www.bignerdranch.com/")
        
        if let url = bigNerdRanch {
            webView.load(URLRequest(url: url))
        }
    }
    
}
