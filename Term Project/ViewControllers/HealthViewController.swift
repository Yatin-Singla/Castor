//
//  HealthViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/5/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit

class HealthViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBAction func HandleSwipe(_ sender: UISwipeGestureRecognizer)
    {
        if sender.direction == .left {
            print("Left Swipe Gesture Recognized")
            self.tabBarController?.selectedIndex += 1
        }
        else if sender.direction == .right{
            print("Right Swipe Gesture Recognized")
            self.tabBarController?.selectedIndex -= 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = "Health Analytics"
    }


}

