//
//  AddViewController.swift
//  Simple Memo
//
//  Created by 下村一将 on 2016/06/26.
//  Copyright © 2016年 kazu/juki. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    var param:Int!
    
    let ad = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Input_title.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let _ = param {
            Input_title.text = ad.dataArray[param]
            Input_text.text = ad.dataList[param]
        }
    }
    @IBAction func Finish_title(sender: UITextField) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Input_finish(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var Input_title: UITextField!
    @IBOutlet weak var Input_text: UITextView!


    @IBAction func Submit(sender: AnyObject) {
        ad.dataArray.append(Input_title.text!)
        ad.dataList.append(Input_text.text!)

        navigationController?.popViewControllerAnimated(true)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if Input_text.text == "本文を入力してください。"{
            Input_text.text = ""
        }
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        if Input_text.text == "" {
            Input_text.text = "本文を入力してください。"
        }
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
    

