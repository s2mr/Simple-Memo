//
//  ViewController.swift
//  Simple Memo
//
//  Created by 下村一将 on 2016/06/26.
//  Copyright © 2016年 kazu/juki. All rights reserved.
//

import UIKit
import SpriteKit

class MemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let ad = UIApplication.sharedApplication().delegate as! AppDelegate
    var selectedRow = 0
    
    var skView:SKView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !ad.isOnce {
            
            let _ = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: #selector(MemoViewController.hide), userInfo: nil, repeats: false)
            
            skView = self.view as! SKView
            
            //上記より画面ぴったりサイズのフレームを生成する
            let frame:CGRect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            
            //カスタマイズViewを生成
            skView = SKView(frame: frame)
            
            //カスタマイズViewを追加
            self.view.addSubview(skView)
            
            self.tabBarController?.tabBar.hidden = true
            self.navigationController?.navigationBar.hidden = true
            ad.isOnce = true
        }else {
            skView.removeFromSuperview()
        }
        
        ad.load()
        Memo_List.rowHeight = 60
//        navigationController?.navigationBar.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        Memo_List.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        showParticle()
    }
    
    

    @IBOutlet weak var Memo_List: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ad.dataList.count
    }
    //セルの内容を返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //再利用可能なセルを得る
        let cell: UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        //セルに値を設定する
        cell.textLabel?.text = "タイトル：\(ad.dataArray[indexPath.row])"
        cell.detailTextLabel?.text = "本文： \(ad.dataList[indexPath.row])"
        
        if ad.font == "Helvetica" {
            cell.textLabel?.font = UIFont(name: "Helvetica", size: 24)
            cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 15)
        } else if ad.font == "STHeltiTC-Light" {
            cell.textLabel?.font = UIFont(name: "STHeltiTC-Light", size: 24)
            cell.detailTextLabel?.font = UIFont(name: "STHeltiTC-Light", size: 15)
        }else if ad.font == "TimesNewRomanPS-BoldItalic" {
            cell.textLabel?.font = UIFont(name: "TimesNewRomanPS-BoldItalic", size: 18)
            cell.detailTextLabel?.font = UIFont(name: "TimesNewRomanPS-BoldItalic", size: 10)
        }
        
        return cell
    }
    //セル削除可能
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete;
    }

    //セルを選択した時に実行される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRow = indexPath.row
        performSegueWithIdentifier("editPath",sender: nil)
    }

    //Deletボタンが押された時
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            ad.dataArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func showParticle() {
        let scene = LightScene(size: skView.frame.size)
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    
    //ボタンが押されたらデータ追加
    @IBAction func add(sender: UIBarButtonItem) {
        ad.dataArray.append(String(ad.dataArray.count))
        Memo_List.reloadData()
        ad.dataList.append(String(ad.dataArray.count))
        Memo_List.reloadData()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "editPath") {
            let nextViewController: AddViewController = segue.destinationViewController as! AddViewController
            nextViewController.param = selectedRow
        }else{
            print("nothing to do")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hide() {
        self.tabBarController?.tabBar.hidden = false
        self.navigationController?.navigationBar.hidden = false
//        self.view.sendSubviewToBack(skView)
        skView.removeFromSuperview()
    }


}

