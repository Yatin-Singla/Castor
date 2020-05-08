//
//  LandingPageViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/8/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    @IBOutlet weak var LogoImageView: UIImageView!
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SubtitleLabel: UILabel!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    
    private let SignUpBtnColor = UIColor(red: 0.25, green: 0.27, blue: 0.40, alpha: 1.00)
    private let SignUpBtnBorderColor = UIColor(red: 0.69, green: 0.70, blue: 0.78, alpha: 1.00)
    private let TintColor = UIColor(red: 1.00, green: 0.35, blue: 0.40, alpha: 1.00)
    private let TitleFont = UIFont.boldSystemFont(ofSize: 30)
    private let SubtitleFont = UIFont.boldSystemFont(ofSize: 18)
    private let BtnFont = UIFont.boldSystemFont(ofSize: 24)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        //check for session variable
    }
    
    func initialize() {
        TitleLabel.font = TitleFont
        TitleLabel.text = "Welcome to Castor"
        SubtitleLabel.font = SubtitleFont
        SubtitleLabel.text = "Intuitive Stress Management Application"
        LoginBtn.setTitle("Log in", for: .normal)
        LoginBtn.configure(color: .white,
                              font: BtnFont,
                              cornerRadius: 55/2,
                              backgroundColor: .black)
        SignUpBtn.setTitle("Sign Up", for: .normal)
        SignUpBtn.configure(color: SignUpBtnColor,
                            font: BtnFont,
                            cornerRadius: 55/2,
                            borderColor: SignUpBtnBorderColor,
                            backgroundColor: .white,
                            borderWidth: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindSegue(sender: UIStoryboardSegue) {
    }

}
