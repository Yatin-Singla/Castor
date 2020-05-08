//
//  LoginPageViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/8/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var passwordTextField: CustomTextField!
    @IBOutlet var emailTextField: CustomTextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var separatorLabel: UILabel!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    //private let backgroundColor = HelperDarkMode.mainThemeBackgroundColor
    private let tintColor = UIColor(red: 1.00, green: 0.35, blue: 0.40, alpha: 1.00)
    private let titleFont = UIFont.boldSystemFont(ofSize: 30)
    private let buttonFont = UIFont.boldSystemFont(ofSize: 20)
    
    private let textFieldFont = UIFont.systemFont(ofSize: 16)
    private let textFieldColor = UIColor(red: 0.69, green: 0.70, blue: 0.78, alpha: 1.00)
    private let textFieldBorderColor = UIColor(red: 0.69, green: 0.70, blue: 0.78, alpha: 1.00)
    
    private let separatorFont = UIFont.boldSystemFont(ofSize: 14)
    private let separatorTextColor = UIColor(red: 0.27, green: 0.27, blue: 0.27, alpha: 1.00)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialize()
    }
    
    func initialize() {
        backButton.tintColor = UIColor(red: 0.16, green: 0.18, blue: 0.31, alpha: 1.00)
        
        titleLabel.font = titleFont
        titleLabel.text = "Log In"
        titleLabel.textColor = tintColor
        
        emailTextField.configure(color: textFieldColor,
                                        font: textFieldFont,
                                        cornerRadius: 55/2,
                                        borderColor: textFieldBorderColor,
                                        backgroundColor: .white,
                                        borderWidth: 1.0)
        emailTextField.clipsToBounds = true
        
        passwordTextField.configure(color: textFieldColor,
                                    font: textFieldFont,
                                    cornerRadius: 55/2,
                                    borderColor: textFieldBorderColor,
                                    backgroundColor: .white,
                                    borderWidth: 1.0)
        passwordTextField.clipsToBounds = true
        
        separatorLabel.font = separatorFont
        separatorLabel.textColor = separatorTextColor
        separatorLabel.text = "OR"
        
        loginButton.setTitle("Log In", for: .normal)
        
        loginButton.configure(color: .white,
                              font: buttonFont,
                              cornerRadius: 55/2,
                              backgroundColor: tintColor)
        
        facebookButton.setTitle("Facebook Login", for: .normal)
        
        facebookButton.configure(color: .white,
                                 font: buttonFont,
                                 cornerRadius: 55/2,
                                 backgroundColor: UIColor(red: 0.20, green: 0.30, blue: 0.57, alpha: 1.00))
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.navigationController?.setNavigationBarHidden(true, animated: false)
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
