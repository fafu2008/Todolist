//
//  TableViewController.swift
//  Todolist
//
//  Created by 许佳强 on 16/4/18.
//  Copyright © 2016年 ttg. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.refreshControl = UIRefreshControl()
       
        self.refreshControl?.addTarget(self, action: #selector(TableViewController.refresh), forControlEvents: UIControlEvents.AllEvents)

    }
    func refresh(){
        NSLog("refresh刷新了")
         self.refreshControl?.attributedTitle = NSAttributedString(string:"下拉刷新")
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "nsTimerRefresh", userInfo: nil, repeats: false)
        
    }
    func nsTimerRefresh(){
        NSLog("nsTimerRefresh刷新了")
        self.refreshControl?.endRefreshing()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        NSLog("viewDidAppear")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       // NSLog("Click: \(indexPath.row)")
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("tododetail") as! ViewController
        
        viewController.row = indexPath.row
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
        
    }
    
    
    
    // MARK: - Table view data source


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
