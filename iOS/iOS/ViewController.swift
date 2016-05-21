//
//  ViewController.swift
//  iOS
//
//  Created by Krueger Nicolai on 21/05/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!

    @IBAction func buttonPress(sender: UIButton) {
        
        displayLabel.text = "Hello World!"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

