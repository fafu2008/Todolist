//
//  AlertDemoViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/4/25.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class AlertDemoViewController: UIViewController ,UIAlertViewDelegate ,UIPickerViewDataSource ,UIPickerViewDelegate{

    @IBOutlet var pickerView1: UIPickerView!
    
    var people = ["agui","xujiaqiang","pengpeng","xiaofei"]
    var friends = ["cat","pig","dog","rat"]
    
    var provice = ["广东","江西","湖南","福建"]
    var city = ["广东":["广州","深圳","东莞","惠州"],"江西":["南昌","赣州市","九东","吉安"],"湖南":["长沙","岳阳","郴州","衡阳"],"福建":["福州","厦门","泉州","龙岩"]]
    var selectProviceIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView1.dataSource = self
        pickerView1.delegate = self
        pickerView1.backgroundColor = UIColor.greenColor()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func button1Click(sender: UIButton) {
        let alertView = UIAlertView(title: "你好", message: "hello world", delegate: self, cancelButtonTitle: "OK", otherButtonTitles: "Cancel1")
        alertView.alertViewStyle = UIAlertViewStyle.SecureTextInput
        alertView.show()        
    }
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        
        let inputValue = alertView.textFieldAtIndex(0)?.text
        
        UIAlertView(title: "Value", message: "Value is : \(inputValue)", delegate: nil, cancelButtonTitle: "OK").show()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 2
    }
    
  
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if(component == 0){
            return provice.count
        }else{
            if(selectProviceIndex != -1){
                return city[provice[selectProviceIndex]]!.count
            }else
            {
                return 0
            }
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return provice[row]
        }else{
            if(selectProviceIndex != -1){
                return city[provice[selectProviceIndex]]![row]
            }else{
                return ""
            }
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            selectProviceIndex = row
            pickerView1.reloadComponent(1)
            pickerView1.selectRow(0, inComponent: 1, animated: false)
            
        }else{
            NSLog("Select friends \(friends[row])")
        }
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 120
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
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
