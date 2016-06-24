//
//  NavigationViewController2.swift
//  Todolist
//
//  Created by 许佳强 on 16/6/16.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class NavigationViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backClicked(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
