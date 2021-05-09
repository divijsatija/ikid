//
//  DadViewController.swift
//  iKid
//
//  Created by Divij Satija on 5/8/21.
//

import UIKit

class DadViewController: UIViewController {
    
    var firstViewController : DadFirstViewController! = nil
    var secondViewController : DadSecondViewController! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        secondBuilder()
        firstBuilder()
        
        switchViewController(nil, to: firstViewController)
    }
    
    @IBAction func switchButton(_ sender: Any) {
        switchViews()
    }
    
    @IBAction func switchViews() {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationCurve(.easeInOut)
        
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(firstViewController, to: secondViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(secondViewController, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController = storyboard?
                .instantiateViewController(identifier: "dad1")
            as! DadFirstViewController
        }
    }
    
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController = storyboard?
                .instantiateViewController(identifier: "dad2")
            as! DadSecondViewController
        }
    }
}
