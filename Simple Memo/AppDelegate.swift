//
//  AppDelegate.swift
//  Simple Memo
//
//  Created by 下村一将 on 2016/06/26.
//  Copyright © 2016年 kazu/juki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var dataArray:[String] = []
    var dataList:[String] = []
    var window: UIWindow?
    
    var font = ""
    var size:Int = 15
    var isOnce = false

    @IBOutlet weak var Input_title: UITextField!
    @IBOutlet weak var Input_text: UITextView!

    
    func load() {
        //データ読み込み
        let ud = NSUserDefaults()
        let setting_font = ud.objectForKey("FONT")
        let setting_size = ud.objectForKey("SIZE")
        
        if setting_font as? String != nil {
            font = setting_font as! String
        }
        if setting_size as? Int != nil {
            size = setting_size as! Int
        }
    }
    
    func save() {
        // NSUserDefaults のインスタンス取得
        let ud = NSUserDefaults.standardUserDefaults()
        let setting_font = font
        let setting_size = size
        
        // キーを指定してオブジェクトを保存
        ud.setObject(setting_font, forKey: "FONT")
        ud.setObject(setting_size, forKey: "SIZE")

    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

