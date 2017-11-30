//
//  PersonModel.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import Realm
import RealmSwift


/// Gender enumeration used for assigning gender to the person object
///
/// - Male: Male Gender
/// - Female: Female Gender
enum Gender: String {
    case Male, Female
}

/// A person object that is stored in the realm database.
class Person: Object {
    // Non-Optional
    @objc dynamic var name = ""
    @objc dynamic var gender = Gender.Male.rawValue
    
    // Optinal
    @objc dynamic var pictureData: Data? = nil
    
    // Clothing Relationship
    let clothing = List<Clothing>()
}
