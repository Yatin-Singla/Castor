//
//  ExerciseViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/5/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBAction func HandleSwipe(_ sender: UISwipeGestureRecognizer)
    {
        print("right Swipe Gesture Recognized")
        self.tabBarController?.selectedIndex -= 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
