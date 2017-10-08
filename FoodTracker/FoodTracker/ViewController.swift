//
//  ViewController.swift
//  FoodTracker
//
//  Created by Paul on 2017-10-08.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//all outlets are optionals that are forced unwrapped. if not set it will cause it to crash.
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }

    
//actions

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        mealNameLabel.text = "Default text"
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    

}

