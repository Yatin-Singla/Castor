//
//  LoginPageViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/8/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginPageViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var passwordTextField: CustomTextField!
    @IBOutlet var emailTextField: CustomTextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var separatorLabel: UILabel!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    
    private let tintColor = UIColor(red: 0.15, green: 0.27, blue: 0.33, alpha: 1.00)
    private let titleFont = UIFont.boldSystemFont(ofSize: 30)
    private let buttonFont = UIFont.boldSystemFont(ofSize: 20)
    
    private let textFieldFont = UIFont.systemFont(ofSize: 16)
    private let textFieldColor = UIColor(red: 0.69, green: 0.70, blue: 0.78, alpha: 1.00)
    private let textFieldBorderColor = UIColor(red: 0.69, green: 0.70, blue: 0.78, alpha: 1.00)
    
    private let separatorFont = UIFont.boldSystemFont(ofSize: 14)
    private let separatorTextColor = UIColor(red: 0.27, green: 0.27, blue: 0.27, alpha: 1.00)
    
    var UserEmail: String?
    var UserPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialize()
        if UserEmail != nil {
            emailTextField.text = UserEmail!
        }
        if UserPassword != nil {
            passwordTextField.text = UserPassword!
        }
    }
    
    func initialize() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        backButton.tintColor = UIColor(red: 0.16, green: 0.18, blue: 0.31, alpha: 1.00)
        
        titleLabel.font = titleFont
        titleLabel.text = "Log In"
        titleLabel.textColor = .white
        
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
        separatorLabel.textColor = .white
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
                                 backgroundColor: .black)
        //UIColor(red: 0.20, green: 0.30, blue: 0.57, alpha: 1.00)
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func unwindLogoutSegue(_ sender: UIStoryboardSegue) {
        // Sign out current user
        try? Auth.auth().signOut()
    }
    
    @IBAction func LogInTapped(_ sender: UIButton) {
        // Sign in (existing user)
        Auth.auth().signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        { authResult, error in
            if let err = error {
                let alert = UIAlertController(title: "Error",
                                              message: err.localizedDescription, preferredStyle: .alert)
                let tryAgainAction = UIAlertAction(title: "Let's try again?", style: .default,
                                             handler: { (action) in
                                                // execute some code when this option is selected
                                                print("Let's try again?")
                                            })
                alert.addAction(tryAgainAction)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "LoginSegue", sender: self)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
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
