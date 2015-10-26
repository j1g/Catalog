//
//  DetailViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 j1g. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var urlStr : String!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        if let url = NSURL(string: "https://en.wikipedia.org/wiki/\(urlStr)") {
            let request = NSURLRequest(URL: url)
            self.webView.loadRequest(request)
        }
        else {
            print("URL 에러")
        }
    }
}
