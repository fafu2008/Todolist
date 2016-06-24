//
//  ImageViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/4/25.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //myImage1.image = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://www.dpfile.com/sc/ares_pics/9e6100ac4dc3c70f46b9e735f5ebc06d.jpg")!)!)
        //myImage1.image = UIImage(named: "AppIcon57x57")!
        //myImage1.animationImages = [UIImage(named: "AppIcon57x57")!,UIImage(named: "guide_35_2")!,UIImage(named: "guide_35_4")!,UIImage(named: "guide_40_1")!]
        //myImage1.animationDuration = 4
        //myImage1.animationRepeatCount = 2
       // myImage1.startAnimating()
        
        //myImage1.animationDidStop(CAAnimation, finished: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let vc = ImageViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet var myImage1: UIImageView!


}
