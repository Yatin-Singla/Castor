//
//  SignUpViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/8/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nameTextField: CustomTextField!
    @IBOutlet var phoneNumberTextField: CustomTextField!
    @IBOutlet var passwordTextField: CustomTextField!
    @IBOutlet var emailTextField: CustomTextField!
    @IBOutlet var signUpButton: UIButton!
    
    private let tintColor = UIColor(red: 0.15, green: 0.27, blue: 0.33, alpha: 1.00)
    private let textFieldColor = UIColor(red: 0.69, green: 0.70, blue: 0.78, alpha: 1.00)
    
    private let textFieldBorderColor = UIColor(red: 0.69, green: 0.70, blue: 0.78, alpha: 1.00)

    private let titleFont = UIFont.boldSystemFont(ofSize: 30)
    private let textFieldFont = UIFont.systemFont(ofSize: 16)
    private let buttonFont = UIFont.boldSystemFont(ofSize: 20)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialize()
    }
    
    func initialize() {
        passwordTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        nameTextField.delegate = self
        titleLabel.font = titleFont
        titleLabel.text = "Sign Up"
        titleLabel.textColor = .white
        
        nameTextField.configure(color: textFieldColor,
                                font: textFieldFont,
                                cornerRadius: 40/2,
                                borderColor: textFieldBorderColor,
                                backgroundColor: .white,
                                borderWidth: 1.0)
        nameTextField.placeholder = "Full Name"
        nameTextField.clipsToBounds = true
        
        emailTextField.configure(color: textFieldColor,
                                 font: textFieldFont,
                                 cornerRadius: 40/2,
                                 borderColor: textFieldBorderColor,
                                 backgroundColor: .white,
                                 borderWidth: 1.0)
        emailTextField.placeholder = "E-mail Address"
        emailTextField.clipsToBounds = true
        
        phoneNumberTextField.configure(color: textFieldColor,
                                       font: textFieldFont,
                                       cornerRadius: 40/2,
                                       borderColor: textFieldBorderColor,
                                       backgroundColor: .white,
                                       borderWidth: 1.0)
        phoneNumberTextField.placeholder = "Phone Number"
        phoneNumberTextField.clipsToBounds = true
        
        passwordTextField.configure(color: textFieldColor,
                                    font: textFieldFont,
                                    cornerRadius: 40/2,
                                    borderColor: textFieldBorderColor,
                                    backgroundColor: .white,
                                    borderWidth: 1.0)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clipsToBounds = true
        
        signUpButton.setTitle("Create Account", for: .normal)
        signUpButton.configure(color: .white,
                               font: buttonFont,
                               cornerRadius: 40/2,
                               backgroundColor: tintColor)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

    @IBAction func SignUpTapped(_ sender: UIButton) {
        let email = emailTextField.text as! String
        let password = passwordTextField.text as! String
        Auth.auth().createUser(withEmail: email, password: password) {
            authResult, error in
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
                //prepare segue
                self.performSegue(withIdentifier: "SuccessfullyCreatedAccount", sender: self)
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SuccessfullyCreatedAccount") {
            let LandingPageVC = segue.destination as! LandingPageViewController
            LandingPageVC.UserEmail = self.emailTextField.text
            LandingPageVC.UserPassword = self.passwordTextField.text
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
