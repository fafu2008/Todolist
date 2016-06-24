//
//  CustomRefreshViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/6/13.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class CustomRefreshViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    //新闻数组集合
    var dataArray:[HanggeArticle] = [HanggeArticle]()
    
    //拉刷新控制器
    var refreshControl = UIRefreshControl()
    
    var customView: UIView!
    
    var labelsArray: Array<UILabel> = []
    
    var currentColorIndex = 0
    
    var currentLabelIndex = 0
    
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "下拉刷新控制器"
        
        let newsTableView = UITableView(frame: CGRect(x: 0, y: 10, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
        
        newsTableView.addSubview(refreshControl)
        newsTableView.tag = 10
        //newsTableView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        
        self.view.addSubview(newsTableView)
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        //添加刷新
        refreshControl.addTarget(self, action: #selector(CustomRefreshViewController.refreshData),
                                 forControlEvents: UIControlEvents.ValueChanged)
        
        //背景色和tint颜色都要清除,保证自定义下拉视图高度自适应
        refreshControl.backgroundColor = UIColor.clearColor()
        refreshControl.tintColor = UIColor.clearColor()


        loadData()
        
        //加载自定义刷新界面
        loadCustomRefreshView()
    }
    //计时器时间到,加载数据
    func loadData() {
        //移除老数据
        self.dataArray.removeAll()
        //随机添加5条新数据（时间是当前时间）
        for _ in 0..<5 {
            let atricle = HanggeArticle(title: "新闻标题\(Int(arc4random()%1000))",createDate: NSDate())
            self.dataArray.append(atricle)
        }
        let table = self.view.viewWithTag(10) as! UITableView
        table.reloadData()
        self.refreshControl.endRefreshing()
        
        timer?.invalidate()
        timer = nil
    }
    
    //自定义刷新界面
    func loadCustomRefreshView() {
        
        customView = UIView(frame: CGRect(x: (UIScreen.mainScreen().bounds.width - 230) / 2, y: 0, width: 230, height: 50))
        let label = UILabel(frame: CGRect(x: 50, y: 0, width: 130, height: 20))
        label.tag = 1
        label.text = "下拉刷新数据1"
        customView.addSubview(label)
        /*
        let label1 = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        let label2 = UILabel(frame: CGRect(x: 40, y: 0, width: 20, height: 20))
        let label3 = UILabel(frame: CGRect(x: 80, y: 0, width: 20, height: 20))
        let label4 = UILabel(frame: CGRect(x: 120, y: 0, width: 20, height: 20))
        let label5 = UILabel(frame: CGRect(x: 160, y: 0, width: 20, height: 20))
        let label6 = UILabel(frame: CGRect(x: 200, y: 0, width: 20, height: 20))
        label1.tag = 1
        label2.tag = 2
        label3.tag = 3
        label4.tag = 4
        label5.tag = 5
        label6.tag = 6
        customView.addSubview(label1)
        customView.addSubview(label2)
        customView.addSubview(label3)
        customView.addSubview(label4)
        customView.addSubview(label5)
        customView.addSubview(label6)
        
        for i in 0 ..< customView.subviews.count {
            labelsArray.append(customView.viewWithTag(i + 1) as! UILabel)
        }
         */
        refreshControl.addSubview(customView)

    }
    
    //滚动视图开始拖动
    var isBegin:Bool = false
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        if !refreshControl.refreshing {
//            self.labelsArray[0].text = "下"
//            self.labelsArray[1].text = "拉"
//            self.labelsArray[2].text = "刷"
//            self.labelsArray[3].text = "新"
//            self.labelsArray[4].text = "数"
//            self.labelsArray[5].text = "据"
//        }
        isBegin = true
        print("scrollViewWillBeginDragging")
        let label = customView.viewWithTag(1) as! UILabel
        if (refreshControl.refreshing == false){
            label.text = "下拉刷新数据2"
        }else{
            label.text = "下拉刷新数据3"
        }
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isBegin = false
        print("scrollViewDidEndDragging")
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        
        print("scrollViewWillBeginDecelerating")

        if (scrollView.contentOffset.y > 50){
            let label = customView.viewWithTag(1) as! UILabel
            label.text = "下拉刷新数据7"
        }
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        print("scrollViewDidEndDecelerating")

        if (scrollView.contentOffset.y > 50){
            let label = customView.viewWithTag(1) as! UILabel
            label.text = "下拉刷新数据8"
        }
    }
    
    //视图拖动
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //加载界面透明度改变
        let sg = (scrollView.contentOffset.y * -1 ) / 200.0
        customView.alpha = sg
        print("scrollViewDidScroll")
        if (scrollView.contentOffset.y < -100.0 && isBegin == true){
            let label = customView.viewWithTag(1) as! UILabel
            label.text = "下拉刷新数据6"
        }
    }
    
    // 刷新数据
    func refreshData() {
//        self.labelsArray[0].text = "数"
//        self.labelsArray[1].text = "据"
//        self.labelsArray[2].text = "加"
//        self.labelsArray[3].text = "载"
//        self.labelsArray[4].text = "中"
//        self.labelsArray[5].text = "..."
//        
//        //播放动画
//        playAnimateRefresh()
//        
//        //模拟加载数据
//        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self,
//                                                       selector: #selector(CustomRefreshViewController.loadData), userInfo: nil, repeats: true)
        let label = customView.viewWithTag(1) as! UILabel
        if (refreshControl.refreshing == false){
            label.text = "下拉刷新数据4"
        }else{
            label.text = "下拉刷新数据5"
        }
        performSelector(#selector(CustomRefreshViewController.loadData), withObject: self, afterDelay: 1.5)
    }
    
    //播放文字动画
    func playAnimateRefresh() {
        //文字放大，变色动画
        UIView.animateWithDuration(0.15, delay: 0.0,
                                   options: .CurveLinear, animations: { () -> Void in
                                    
                                    self.labelsArray[self.currentLabelIndex].transform =
                                        CGAffineTransformMakeScale(1.5, 1.5)
                                    self.labelsArray[self.currentLabelIndex].textColor =
                                        self.getNextColor()
                                    
            }, completion: { (finished) -> Void in
                
                //文字样式还原动画
                UIView.animateWithDuration(0.1, delay: 0.0,
                    options: .CurveLinear, animations: { () -> Void in
                        
                        self.labelsArray[self.currentLabelIndex].transform =
                        CGAffineTransformIdentity
                        self.labelsArray[self.currentLabelIndex].textColor =
                            UIColor.blackColor()
                        
                    }, completion: { (finished) -> Void in
                        self.currentLabelIndex += 1
                        
                        if self.currentLabelIndex == self.labelsArray.count - 1 {
                            self.currentLabelIndex = 0
                        }
                        
                        //没加载完则继续播放动画
                        if self.refreshControl.refreshing {
                            self.playAnimateRefresh()
                        }else{
                            self.currentLabelIndex = 0
                        }
                })
        })
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    // 返回记录数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // 返回单元格内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                                       reuseIdentifier: "myCell")
            
            //设置单元格标题
            let atricle: HanggeArticle = dataArray[indexPath.row] as HanggeArticle
            cell.textLabel?.text = atricle.title
            
            //设置单元格副标题
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let str = dateFormatter.stringFromDate(atricle.createDate)
            cell.detailTextLabel?.text = str
            
            return cell;
    }
    
    //获取下一个颜色
    func getNextColor() -> UIColor {
        var colorsArray: Array<UIColor> = [UIColor.magentaColor(),
                                           UIColor.brownColor(), UIColor.yellowColor(), UIColor.redColor(),
                                           UIColor.greenColor(), UIColor.blueColor(), UIColor.orangeColor()]
        
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        
        return returnColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
}
//新闻结构体
struct HanggeArticle {
    var title:String
    var createDate:NSDate
}
