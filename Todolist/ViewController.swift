//
//  ViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/4/18.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var row = 0
    var timer1:NSTimer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        laber1.text = "Click row is \(row)"
        let segment:UISegmentedControl =  self.view.viewWithTag(12) as! UISegmentedControl
        segment.selectedSegmentIndex = 1
        
        progress1.progress = 0
        timer1 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.changeProgress(_:)), userInfo: nil, repeats: true)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.NSNotificationCentertest1), name: "NSTOTIFICATIONTEST", object: nil)
        
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(view)
        }
        
        
    }
    
    func NSNotificationCentertest1(){
        NSLog("NSNotificationCentertest1")
    }
    
    func changeProgress(sender: NSTimer){
        progress1.progress += 0.1
        if(progress1.progress >= 1){
            timer1!.invalidate()
        }
        
    }

    @IBOutlet var progress1: UIProgressView!
    @IBOutlet var laber1: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sugmentedValueChange(sender: UISegmentedControl) {
        
        switch(sender.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.blackColor()
        case 1:
            self.view.backgroundColor = UIColor.whiteColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        case 3:
            self.view.backgroundColor = UIColor.blueColor()
        default:
            self.view.backgroundColor = UIColor.redColor()
        }
        
    }
    
    @IBAction func buttonCliek(sender: UIButton) {
        
        let segment:UISegmentedControl =  self.view.viewWithTag(12) as! UISegmentedControl
        
        //self.storyboard?.instantiateViewControllerWithIdentifier("mysegment") as! UISegmentedControl
        segment.selectedSegmentIndex = 3
        //segment.removeSegmentAtIndex(1, animated: true)
        //segment.insertSegmentWithTitle("Sudy", atIndex: segment.numberOfSegments, animated: true)
        
        //发消息
    NSNotificationCenter.defaultCenter().postNotificationName("NSTOTIFICATIONTEST", object: nil)
        
        NSLog("slider1 = \(slider1.value)")
        
        //网络取数据
        let url = NSURL(string: "http://www.qq.com")!
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (_, data, e) in
            //print(data)
        }
        
    }
    
    @IBAction func push2TabBarViewController(){
        //self.navigationController?.pushViewController(CustomRefreshViewController(), animated: true)
        self.presentViewController(TabViewController(), animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var textField1: UITextField!
    @IBAction func textField1EditExit(sender: UITextField) {
        NSLog("textField1EditExit")
        sender.resignFirstResponder()
    }
  
    @IBAction func control1TouchDown(sender: AnyObject) {
        NSLog("control1TouchDown")
        //textField1.resignFirstResponder()
        textField1.resignFirstResponder()

    }
    
    @IBOutlet var slider1: UISlider!
    
    
    @IBOutlet var uiActivityIndicator: UIActivityIndicatorView!
    
    @IBAction func swich1ValueChange(sender: UISwitch) {
        if(sender.on){
            uiActivityIndicator.startAnimating()
        }else{
            uiActivityIndicator.stopAnimating()
        }
        
        
    }
    
    @IBOutlet var myStepper1: UIStepper!
    
    @IBOutlet var mytextField2: UITextField!
    
    @IBAction func stepperValueChange(sender: UIStepper) {
       mytextField2.text = NSString(format: "%g", sender.value) as String
    
        
    }
    
    
    

}

