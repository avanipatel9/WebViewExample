//
//  ViewController.swift
//  WebViewExample
//
//  Created by Avani Patel on 3/24/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    var historyList:[WKBackForwardListItem] = []
    @IBOutlet weak var myWebKitView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLambtonUrl()
        
    }
    
    @IBAction func btnHistoryClck(_ sender: Any) {
        if myWebKitView.canGoBack
        {
            historyList = myWebKitView.backForwardList.backList
            if historyList.count>0
            {
                let historyTableVC = sb.instantiateViewController(identifier: "HistoryTableViewController") as HistoryTableViewController
                historyTableVC.history=self.historyList; self.navigationController?.pushViewController(historyTableVC, animated: true)
            }
            
        }
        
    }
    func loadLambtonUrl()
    {
        let url = URL(string: "https://www.lambtoncollege.ca/")
        let urlReq = URLRequest(url: url!)
        myWebKitView.load(urlReq)
    }
    
    func loadHtmlString()
    {
        let htmlString = "<h1>Hello World</h1>"
        myWebKitView.loadHTMLString(htmlString, baseURL: nil)
        
    }

    @IBAction func btnNavigation(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0://Home Button is pressed
            myWebKitView.reloadFromOrigin()
        case 1://Prev Button is pressed
            if myWebKitView.canGoBack
            {
                print("Go back")
                myWebKitView.goBack()
            }else
            {
                print("Can't go back")
            }
        case 2:
            if myWebKitView.canGoForward
            {
                print("Go forward")
                myWebKitView.goForward()
            }
            else
            {
                print("Can't go forward")
            }
        case 3:
            myWebKitView.reloadFromOrigin()
            //myWebKitView.reload()
            
            
        default:
            print("No navigation action found...")
        }
    }
    
}

