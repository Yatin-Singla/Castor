//
//  StressViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/5/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit

class StressViewController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBAction func HandleSwipe(_ sender: UISwipeGestureRecognizer)
    {
        print("Left Swipe Gesture Recognized")
        self.tabBarController?.selectedIndex += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }


}

