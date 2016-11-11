//
//  TransitonVC.swift
//  SOTransition
//
//  Created by Hitesh on 11/11/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class TransitonVC: UIViewController {
    
    var iRow : Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func actionBack(sender: AnyObject) {
        if iRow == 0 {
            self.navigationController?.popViewControllerAnimated(true)
        } else if iRow == 1 {
            self.dismissViewControllerAnimated(true, completion: nil)
        } else if iRow ==  2 {
            self.navigationController?.popViewControllerAnimated(true)
            let transitionView = self.navigationController?.view
            UIView.transitionWithView(transitionView!, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: { () -> Void in
                
            }) { (success) -> Void in
                
            }
        } else if iRow == 3 {
            self.navigationController?.popViewControllerAnimated(true)
            let transitionView = self.navigationController?.view
            UIView.transitionWithView(transitionView!, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                
            }) { (success) -> Void in
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
