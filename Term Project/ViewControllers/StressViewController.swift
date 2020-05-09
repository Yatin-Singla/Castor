//
//  StressViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/5/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit

class StressViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBAction func ScheduleNotificationTapped(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings(completionHandler: { (settings) in
            if settings.alertSetting == .enabled {
                print("notifications enabled")
                self.scheduleNotification()
            } else {
                print("notifications disabled")
            }
        })
    }
    
    @IBAction func HandleSwipe(_ sender: UISwipeGestureRecognizer)
    {
        print("Left Swipe Gesture Recognized")
        self.tabBarController?.selectedIndex += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = "Stress Level"
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "All Vibes no Sweat"
        content.body = "We think you're getting a bit agitated. Let's listen to some relaxing music, shall we?"
        content.userInfo["message"] = "Anxiety Attack"
        // Configure trigger for 5 seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0,
                                                        repeats: false)
        // Create request
        let request = UNNotificationRequest(identifier: content.userInfo["message"] as! String,
                                            content: content, trigger: trigger)
        // Schedule request
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { (error) in
            if let err = error {
                print(err.localizedDescription)
            }
        })
    }
    
    func handleNotification(_ response: UNNotificationResponse) {
        let message = response.notification.request.content.userInfo["message"] as! String
        print("received notification message: \(message)")
        self.tabBarController?.selectedIndex = 3
    }
    
    /*+    @objc func AnxietyPredicted(notification: NSNotification)
    +    {
    +        let center = UNUserNotificationCenter.current()
    +        center.getNotificationSettings(completionHandler: { (settings) in
    +            if settings.alertSetting == .enabled {
    +                print("notifications enabled")
    +                self.scheduleNotification(UniqueID: UUID().uuidString)
    +            } else {
    +                print("notifications disabled")
    +            }
    +        })
         }
     
    +    //check to see if stress prediction is above 8
    +   // NotificationCenter.default.post(name: NSNotification.Name("AnxietyNotification"), object: nil)*/
    
    
}

