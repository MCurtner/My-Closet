//
//  ClothingModel.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import Realm
import RealmSwift

/// Clothing object that is stored in the realm database.
/// Each clothing item is linked to a person object via a 'List<Person>'
class Clothing: Object {
    // Non-Optional
    @objc dynamic var name: String = ""
    @objc dynamic var size: String = ""
    
    // Optional
}
