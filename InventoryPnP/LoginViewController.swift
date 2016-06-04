//
//  LoginViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 03/06/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
    }

}
