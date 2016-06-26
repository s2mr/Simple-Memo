//
//  FromSettingViewController.swift
//  Simple Memo
//
//  Created by 下村一将 on 2016/06/26.
//  Copyright © 2016年 kazu/juki. All rights reserved.
//

import UIKit

class FromSettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var toDo = ""
    let font = ["Helvetica", "Meilio", "Hiragino"]
    let size = ["12", "13", "14", "15", "16"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setting()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if toDo == "font" {
         return 3
        }else {
         return 5
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell1")
        if toDo == "font" {
            cell?.textLabel?.text = font[indexPath.row]
        }else  if toDo == "size" {
            cell?.textLabel?.text = size[indexPath.row]
        }
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if toDo == "font" {
            return "好きなフォントを選んでください"
        }else {
            return "好きなフォントサイズを選んでください"
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    tableView.indexPathForCell(UIT)
    }
    
    func setting() {
        if toDo == "font" {
            navigationItem.title = "フォント設定"
        }else if toDo == "size" {
            navigationItem.title = "文字サイズ設定"
        }
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
