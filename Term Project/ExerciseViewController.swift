//
//  ExerciseViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/5/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var CoverImage: UIImageView!
    @IBOutlet weak var TrackTitle: UILabel!
    @IBOutlet weak var ArtistTitle: UILabel!
    @IBOutlet weak var TrackSlider: UISlider!
    @IBOutlet weak var PlayPause: UIButton!
    @IBOutlet weak var Next: UIButton!
    @IBOutlet weak var Previous: UIButton!
    @IBOutlet weak var LoginBtn: UIButton!
    
    @IBAction func PlayPauseTapped(_ sender: UIButton) {
    }
    @IBAction func NextTapped(_ sender: UIButton) {
    }
    @IBAction func PreviousTapped(_ sender: UIButton) {
    }

    @IBAction func LoginBtnTapped(_ sender: UIButton) {
        print("btn tapped")
    }
    
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
        /*
         if loggedin{
            LoginBtn.isHidden = True
         }
         else{
            everything else is hidden
         }
         */
        LoginBtn.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 0.0)
        LoginBtn.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 8.0)
        LoginBtn.adjustsImageWhenHighlighted = false
        LoginBtn.setImage(UIImage(named: "spotifylogo-32.png"), for: .normal)
        isHidden(value: true)
    }

    func isHidden(value: Bool){
        CoverImage.isHidden = value
        TrackTitle.isHidden = value
        ArtistTitle.isHidden = value
        TrackSlider.isHidden = value
        PlayPause.isHidden = value
        Next.isHidden = value
        Previous.isHidden = value
        LoginBtn.isHidden = !value
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
