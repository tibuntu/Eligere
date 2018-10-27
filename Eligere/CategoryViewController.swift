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
        
        print("Loading categories...")
        
        jsonConnector().jsonGetCategory()
        
        print("Loaded categories")
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorys.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorys[row]
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        
        let rowValue = self.categoryPicker.selectedRow(inComponent: 0)
        
        category = categorys[rowValue]
        
    }
    

}
