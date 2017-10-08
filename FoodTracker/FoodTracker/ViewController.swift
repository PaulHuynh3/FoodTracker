//
//  ViewController.swift
//  FoodTracker
//
//  Created by Paul on 2017-10-08.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
//Mark: properties
//all outlets are optionals that are forced unwrapped. if not set it will cause it to crash.
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }

//Mark: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
        
        
    }
    
//Mark: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //dismiss the picker if the user cancelled
    dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //the info dictionary may contain multiple representations of the image. you want original
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
        UIImage else {
        fatalError("Expected a dict containing an image, but was provided: \(info)")
        }
        
        //set photoimageview to display the selected image.
        photoImageView.image = selectedImage
        
        //dismiss picker
        dismiss(animated: true, completion: nil)
        
    }
    
//Mark: actions

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //if user is on the textfield and they tap this picture it will dimiss keyboard
        nameTextField.resignFirstResponder()
        //uiimagePickerController is a vc that lets user pick media from photo library
    let imagePickerController = UIImagePickerController()
        //only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        //make sure vc is notified when user picks an image
    imagePickerController.delegate = self
        present(imagePickerController,animated: true, completion: nil)
        
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        mealNameLabel.text = "Default text"
        
    }
    


    
    

}

