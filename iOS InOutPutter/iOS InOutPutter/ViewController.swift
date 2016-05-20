//
//  ViewController.swift
//  iOS InOutPutter
//
//  Created by Timo Koller on 20/05/16.
//  Copyright © 2016 Timo Koller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lbl_main: UILabel!
    
    //@IBAction func btn_main(sender: UIButton) {
    //    lbl_main.text = "Hello World!"
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lbl_main.text = "Hello World!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

