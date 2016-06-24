//
//  WebViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/4/26.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView1.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var textField1: UITextField!
    @IBOutlet var webView1: UIWebView!
    @IBAction func backButtonClick(sender: UIButton) {
        webView1.goBack()
    }

    @IBAction func forwardButtonClick(sender: UIButton) {
        webView1.goForward()
    }
    @IBAction func goButtonClick(sender: UIButton) {
        webView1.loadRequest(NSURLRequest(URL: NSURL(string: textField1.text!)!))
        
    }
    @IBAction func reloadButtonClick(sender: UIButton) {
        webView1.reload()
    }
    
    @IBOutlet var uiControl1: UIControl!
    @IBAction func touchDownEvent(sender: UIControl) {
        NSLog("touchDownEvent")
        self.textField1.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
