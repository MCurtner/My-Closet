//
//  AddPersonViewController.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {
    
    /// Outlets
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    // Private variables
    private var ic = ImageController()
    private var pc = PersonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the UIImage circle
        ic.createImageCirle(imageView: personImageView)
    }

    
    /// Dismisses the modal AddPersonViewController
    ///
    /// - Parameter sender: UIBarButtonItem
    @IBAction func dismissVC(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    /// Create and add the person based on entered values.
    ///
    /// - Parameter sender: UIButton
    @IBAction func AddPerson(_ sender: UIButton) {
        // Set the gender based on the selected segment
        var gender: Gender!
        switch genderSegment.selectedSegmentIndex {
        case 0:
            gender = .Male
        case 1:
            gender = .Female
        default:
            gender = .Male
        }
        
        // Check if name field is not empty.
        guard nameTextField.text?.isEmpty == false else {
            // Display Alert
            // TODO:
            assertionFailure("Missing Alert that name is empty")
            
            // Return if name field is empty
            return
        }
        
        // Create and store the person in Realm
        pc.createNewPerson(name: nameTextField.text!, gender: gender, picture: personImageView.image, clothingName: nil, clothingSize: nil)
        
        // Dismiss the Modal ViewController
        dismiss(animated: true, completion: nil)
    }

}

