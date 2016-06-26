//
//  AddViewController.swift
//  Simple Memo
//
//  Created by 下村一将 on 2016/06/26.
//  Copyright © 2016年 kazu/juki. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Finish_title(sender: UITextField) {
        
    }

    @IBAction func Reverse(sender: UIScreenEdgePanGestureRecognizer) {
        self.navigationController?.popToRootViewControllerAnimated(true)
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
