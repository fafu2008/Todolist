//
//  TableViewController2.swift
//  Todolist
//
//  Created by 许佳强 on 16/4/27.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class TableViewController2: UIViewController,UITableViewDataSource, UITableViewDelegate{

    var cities = ["深圳","北京","上海","广州","东莞"]
    
    var tableView1:UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView1 = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)

        tableView1.delegate = self
        tableView1.dataSource = self
        // Do any additional setup after loading the view.
     
        self.view.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        let bodyView = UIView()
        bodyView.frame = self.view.frame
        bodyView.frame.y += 20 + 44
        self.view.addSubview(bodyView)
        
        
        //🌟 Usage
        let tableViewWrapper = PullToBounceWrapper(scrollView: tableView1)
        bodyView.addSubview(tableViewWrapper)
        
        tableViewWrapper.didPullToRefresh = {
            NSTimer.schedule(delay: 2) { timer in
                tableViewWrapper.stopLoadingAnimation()
            }
        }
        //makeMock()
        
        
 //1
        
//        let bodyView = UIView(frame: self.view.frame)
//        print(self.navigationController?.navigationBar.frame.height)
//        bodyView.frame.y += 64
//        print(bodyView.frame)
//        bodyView.backgroundColor = UIColor.redColor()
//        self.view.addSubview(bodyView)
//        self.view.backgroundColor = UIColor.greenColor()
        
//        tableView1 = UITableView(frame: self.view.frame)
//        self.view.addSubview(tableView1)
//        tableView1.delegate = self
//        tableView1.dataSource = self
//        print(tableView1.frame)
//        let customRefreshView = CustomRefreshView(frame: CGRect(x: 0, y: 0, width: tableView1.bounds.width, height: 80))
//        
//        tableView1.addPullToRefreshWithAction({
//
//            NSOperationQueue().addOperationWithBlock {
//
//                sleep(2)
//                NSOperationQueue.mainQueue().addOperationWithBlock {
//                    self.tableView1.stopPullToRefresh()
//
//                }
//            }
//            }, withAnimator: customRefreshView)
//        
//        
//        
    }
    
//    func makeMock() {
//        let headerView = UIView()
//        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 64)
//        headerView.backgroundColor = UIColor(red:0.700062, green: 0.817345, blue: 0.972549, alpha: 1)
//        self.view.addSubview(headerView)
//        
//        let headerLine = UIView()
//        headerLine.frame = CGRect(x: 0, y: 0, width: 120, height: 8)
//        headerLine.layer.cornerRadius = headerLine.frame.height/2
//        headerLine.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
//        headerLine.center = CGPoint(x: headerView.frame.center.x, y: 20 + 44/2)
//        headerView.addSubview(headerLine)
//    }
//    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return .LightContent
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//        var cellView = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 320, height: 48))
//        cellView.backgroundColor = UIColor.grayColor()
//        cellView.textLabel?.text = cities[indexPath.row]
        let cellId = "xjqcell"
        var cellView:UITableViewCell? = tableView1.dequeueReusableCellWithIdentifier(cellId) //as? UITableViewCell
        if (cellView == nil){
            cellView = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        cellView?.textLabel?.text = cities[indexPath.row]
        cellView?.imageView?.image = UIImage(named: "AppIcon57x57")
        cellView?.detailTextLabel?.text = "detail more ..."
        cellView?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cellView!
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
