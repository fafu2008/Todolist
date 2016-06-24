//
//  TableViewController3.swift
//  Todolist
//
//  Created by 许佳强 on 16/4/28.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class TableViewController3: UIViewController, UITableViewDataSource,UITableViewDelegate{

    var provice = ["广东","江西","湖南","福建"]
    var city = ["广东":["广州","深圳","东莞","惠州"],"江西":["南昌","赣州市","九东","吉安"],"湖南":["长沙","岳阳","郴州","衡阳"],"福建":["福州","厦门","泉州","龙岩"]]
    var buttonTag:Int = 1
    
    @IBOutlet var tableView1: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView1.dataSource = self
        tableView1.delegate = self
        
        // Do any additional setup after loading the view.
   
    }
    
    //编辑tableView列表
    @IBOutlet var editButon1: UIBarButtonItem!
    @IBOutlet var insertButton1: UIBarButtonItem!
    @IBAction func editButtonClick(sender: UIBarButtonItem) {
        buttonTag = 1
        //设置编辑状态
        if(!tableView1.editing){
            editButon1.title = "Done"
            tableView1.setEditing(true, animated: true)
        }else{
            tableView1.setEditing(false, animated: true)
            editButon1.title = "Edit"
        }
    }
    @IBAction func insertButton1Click(sender: UIBarButtonItem) {
        //设置编辑状态
        buttonTag = 2
        if(!tableView1.editing){
            insertButton1.title = "Done"
            tableView1.setEditing(true, animated: true)
        }else{
            insertButton1.title = "Insert"
            tableView1.setEditing(false, animated: true)
        }

    }
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String?{
        return "确认删除?"
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let proviceName = provice[indexPath.section]
        if(buttonTag == 1){
            city[proviceName]?.removeAtIndex(indexPath.row)
            tableView1.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }else{
            city[proviceName]?.insert(city[proviceName]![indexPath.row], atIndex: indexPath.row+1)
            tableView1.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if(buttonTag == 1){
            return UITableViewCellEditingStyle.Delete
        }else{
            return UITableViewCellEditingStyle.Insert
        }
    }
    
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        let proName = provice[section]
        return (city[proName]?.count)!
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return provice.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return provice[section]
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let proviceName = provice[indexPath.section]
        var tableViewCell:UITableViewCell? = tableView1.dequeueReusableCellWithIdentifier("xjqtableviewcell")! as UITableViewCell
        if(tableViewCell == nil){
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "xjqtableviewcell")
        }
        tableViewCell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        let image1 = tableViewCell?.viewWithTag(1) as! UIImageView
        let text1 = tableViewCell?.viewWithTag(2) as! UILabel
        let text2 = tableViewCell?.viewWithTag(3) as! UILabel
        let switch1 = tableViewCell?.viewWithTag(4) as! UISwitch
        
        image1.image = UIImage(named: "AppIcon57x57")
        text1.text = city[proviceName]![indexPath.row]
        
        text2.text = "detail more ..."
        
        var tableViewCell2:UITableViewCell? = tableView1.dequeueReusableCellWithIdentifier("xjqtableviewcell2")! as UITableViewCell
        if(tableViewCell2 == nil){
            tableViewCell2 = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "xjqtableviewcell2")
        }
        tableViewCell2?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        let label1 = tableViewCell2?.viewWithTag(1) as! UILabel
        let textField1 = tableViewCell2?.viewWithTag(2) as! UITextField
        let buttom1 = tableViewCell2?.viewWithTag(3) as! UIButton
        label1.text = city[proviceName]![indexPath.row]
        textField1.text = "请输入内容"
        buttom1.titleLabel?.text = "hello"
 
        if(indexPath.row%2 == 0){
            switch1.on = true
        }else{
            switch1.on = false
        }
        
        if(indexPath.row%2 == 0){
            return tableViewCell!
        }else{
            return tableViewCell2!
        }
    }
    

    
    

}
