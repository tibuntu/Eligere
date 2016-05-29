//
//  ItemAddViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 29/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

var itemName = ""

class ItemAddViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        
    }
    
    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if sender === saveButton {
            
            itemName = nameTextField.text!
            
        }
        
    }

}
