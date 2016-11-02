//
//  WebViewController.swift
//  FoodPinDemo
//
//  Created by cyper on 02/11/2016.
//  Copyright © 2016 cyper tech. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "http://github.com/uniquejava") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

}
