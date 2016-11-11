//
//  ViewController.swift
//  SOTransition
//
//  Created by Hitesh on 11/11/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblTransition: UITableView!
    var arrTransition = NSMutableArray()
    //let objEffect = EffectManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        arrTransition = ["Push", "Present", "Flip", "Disolve"]
    }
    
    //MARK: UITableViewDelegate
    

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    

    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTransition.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = arrTransition.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.viewTransition(indexPath)
    }
    
    func viewTransition(index : NSIndexPath) {
        let objTransition : TransitonVC = self.storyboard?.instantiateViewControllerWithIdentifier("TransitonVCID") as! TransitonVC
        objTransition.iRow = index.row
        if index.row == 0 {
            self.navigationController?.pushViewController(objTransition, animated: true)
        } else if index.row == 1 {
            self.presentViewController(objTransition, animated: true, completion: nil)
        } else if index.row == 2 {
            self.navigationController?.pushViewController(objTransition, animated: false)
            let transitionView = self.navigationController?.view
            UIView.transitionWithView(transitionView!, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: { () -> Void in
                
            }) { (success) -> Void in
                
            }
        } else if index.row == 3 {
            self.navigationController?.pushViewController(objTransition, animated: true)
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


}


class CustomSegue: UIStoryboardSegue {
    override func perform() {
        let source = sourceViewController as UIViewController
        let destination = destinationViewController as UIViewController
        let window = UIApplication.sharedApplication().keyWindow!
        
        destination.view.alpha = 0.0
        window.insertSubview(destination.view, belowSubview: source.view)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            source.view.alpha = 0.0
            destination.view.alpha = 1.0
        }) { (finished) -> Void in
            source.view.alpha = 1.0
            source.presentViewController(destination, animated: false, completion: nil)
        }
    }
}

