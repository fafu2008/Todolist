//
//  TabViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/6/12.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.view.backgroundColor = UIColor.whiteColor()
        let vc1 = ImageViewController()
        let vcna1 = UINavigationController(rootViewController: vc1)
        vc1.title = "你好1"
        vc1.view.backgroundColor = UIColor.redColor()
        vc1.tabBarItem = UITabBarItem(title: "标题1", image: UIImage(named: "gouwuche_1"), selectedImage: UIImage(named: "gouwuche"))
        
        vc1.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.redColor()],forState:UIControlState.Normal)
        
        vcna1.tabBarItem = UITabBarItem(title: "标题1", image: UIImage(named: "icon_baiduWallet_gray"), selectedImage: UIImage(named: "deleten"))

        let vc2 = ImageViewController()
        let vcna2 = UINavigationController(rootViewController: vc2)
        vc2.title = "你好2"
        vc2.view.backgroundColor = UIColor.greenColor()
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 2)
        vcna2.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 2)
        
        let vc3 = ImageViewController()
        let vcna3 = UINavigationController(rootViewController: vc3)
        vcna3.tabBarItem.title = "标题3"
        vcna3.tabBarItem.badgeValue = "123"
        vc3.title = "你好"
        vc3.view.backgroundColor = UIColor.yellowColor()
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 2)
        vc3.tabBarItem.badgeValue = "123"
        
        vcna3.tabBarItem.image = UIImage(named: "icon_baiduWallet_gray")
        
        let vc4 = ImageViewController()
        let vcna4 = UINavigationController(rootViewController: vc4)
        vcna4.tabBarItem.title = "标题4"
        vc4.title = "你好"
        vc4.view.backgroundColor = UIColor.orangeColor()
        vc4.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 2)

        vcna4.tabBarItem.image = UIImage(named: "icon_baiduWallet_gray")
        
        self.viewControllers = [vc1,vc2,vc3,vc4]
        //self.tabBar.barTintColor = UIColor.blueColor()
        //self.tabBar.selectedImageTintColor = UIColor.redColor()
        self.tabBar.tintColor = UIColor.purpleColor()
        self.selectedIndex = 2
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
