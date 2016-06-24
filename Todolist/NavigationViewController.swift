//
//  NavigationViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/6/16.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func navigationClicked(sender: AnyObject) {
//        let navigation2 = self.storyboard?.instantiateViewControllerWithIdentifier("navigation2") as! NavigationViewController2
//        if #available(iOS 8.0, *) {
//            navigation2.modalPresentationStyle = .OverCurrentContext
//        } else {
//            navigation2.modalPresentationStyle = .CurrentContext
//        }
//        self.presentViewController(navigation2, animated: true,completion: nil)
        
        self.presentViewController(TabViewController(), animated: true, completion: nil)

    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
