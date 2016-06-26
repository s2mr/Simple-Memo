//
//  ViewController.swift
//  Simple Memo
//
//  Created by 下村一将 on 2016/06/26.
//  Copyright © 2016年 kazu/juki. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
=======
        navigationController?.navigationBar.backgroundColor = UIColor.blueColor()
>>>>>>> add-setting
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var Memo_List: UITableView!
    var dataArray:[Int] = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    //セルの内容を返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //再利用可能なセルを得る
        let cell: UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        //セルに値を設定する
        cell.textLabel?.text = "\(dataArray[indexPath.row])"
//        cell.detailTextLabel?.text = "Subtitle \(dataArray[indexPath.row])"
        return cell
    }
    //セル削除可能
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete;
    }
    //Deletボタンが押された時
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            dataArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    //ボタンが押されたらデータ追加
    @IBAction func add(sender: UIBarButtonItem) {
        //dataArray.append(dataArray.count)
        Memo_List.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

