//
//  ViewController.swift
//  Test
//
//  Created by Olivia Mellen on 1/23/20.
//  Copyright © 2020 Olivia Mellen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func whenButtonPressed(_ sender: Any) {
        let url = URL(string: "https://www.mysportsfeeds.com/index.php/login/do_login/")!
        var request = NSMutableURLRequest(url: url)

        
        var cookies = HTTPCookieStorage.shared.cookies as! [HTTPCookie]
        
        var reqCookies: [AnyObject] = []
        
        for aCookie in cookies {
            reqCookies += [aCookie]

        }
        
        var headers = HTTPCookie.requestHeaderFields(with: reqCookies as! [HTTPCookie])
        self.webView.loadRequest(request as URLRequest)
        
        request.httpMethod = "POST"
//
        request.addValue("Origin", forHTTPHeaderField: "https://www.mysportsfeeds.com")
        request.addValue("Upgrade-Insecure-Requests", forHTTPHeaderField: "1")
//        request.addValue("Content-Type", forHTTPHeaderField: "application/x-www-form-urlencoded")
//        request.addValue("User-Agent", forHTTPHeaderField: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36")
//        request.addValue("Sec-Fetch-User", forHTTPHeaderField: "?1")
//        request.addValue("Accept", forHTTPHeaderField: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9")

        let bodyData = "rcID=''&submit=Sign In >&uName=rKaiser14&uPassword=Hershey14"
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        webView.loadRequest(request as URLRequest)
    }
    
}

