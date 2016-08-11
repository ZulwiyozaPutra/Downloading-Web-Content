//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Zulwiyoza Putra on 8/11/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://www.stackoverflow.com")!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            //Will happen when task completes
            if let urlContent = data {
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                self.webView.loadHTMLString(String(webContent), baseURL: nil)
            } else {
                // Show error message
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

