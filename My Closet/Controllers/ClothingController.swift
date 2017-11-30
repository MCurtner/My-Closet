//
//  ClothingController.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/30/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class ClothingController {
    
    // Create a RealmManager instance
    var rm = RealmManager()
    
    /// Creates a new clothing object.
    ///
    /// - Parameters:
    ///   - name: Clothing item name
    ///   - size: Clothing size
    /// - Returns: New clothing object based on imput parameters
    func createNewClothing(name: String, size: String) -> Clothing {
        let clothing = Clothing()
        clothing.name = name
        clothing.size = size
        
        return clothing
    }
}
