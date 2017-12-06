//
//  UserInputTextField.swift
//  My Closet
//
//  Created by Matthew Curtner on 12/6/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class UserInputTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
}

extension UserInputTextField: UITextFieldDelegate {
    
    // Dismiss Keyboard when Done/Return Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Set the allowed character to be letters
        let allowedCharacter = CharacterSet.letters
        
        // Check if the character in the string is allowed
        let characterSet = CharacterSet(charactersIn: string)
        
        // If allowed, return (print) the character
        return allowedCharacter.isSuperset(of: characterSet)
    }
}
