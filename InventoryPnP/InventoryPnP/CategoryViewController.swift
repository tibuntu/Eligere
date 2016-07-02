//
//  CategoryViewController.swift
//  InventoryPnP
//
//  Created by Krueger Nicolai on 25/06/16.
//  Copyright © 2016 Krueger Nicolai. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var categoryPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoryPicker.dataSource = self;
        self.categoryPicker.delegate = self;
        
        jsonGetCategory()
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorys.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorys[row]
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        
        let rowValue = self.categoryPicker.selectedRowInComponent(0)
        
        category = categorys[rowValue]
        
    }
    

}
