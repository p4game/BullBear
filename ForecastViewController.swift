//
//  ForecastViewController.swift
//  Stock
//
//  Created by cl on 15/5/26.
//  Copyright (c) 2015年 cl. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("didload")
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: config)
    }
    var session:NSURLSession?
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("appear")
        if islogin {
            fetchFeed("http://127.0.0.1:8000/forecast/view/")
            
        } else {
            fetchFeed("http://127.0.0.1:8000/accounts/login/?account=test&password=123")
            islogin = true
        }
    }
    var islogin:Bool = true
    func fetchFeed(urlStr: String) {
        //"http://bookapi.bignerdranch.com/courses.json"
        let url = NSURL(string: urlStr)
        let req = NSURLRequest(URL: url!)
        let dataTask = session?.dataTaskWithRequest(req){ (nsData, nsRes, nsError) -> Void in
            let dataString  = NSString(data: nsData as NSData, encoding: NSUTF8StringEncoding)
            //let jsonObj:NSDictionary = NSJSONSerialization.JSONObjectWithData(nsData as NSData, options: NSJSONReadingOptions.allZeros, error: nil) as! NSDictionary
            println(dataString)
        }
        dataTask?.resume()
    }
}
