//
//  RealmManager.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

/// The RealmManager controls the adding or removing of realm objects.
class RealmManager {
    
    // Create a realm instance
    private var realm = try! Realm()

    // MARK: - General
    /// Delete all the content in the database.
    internal func deleteRealms() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    // MARK: - Person
    
    /// Adds a person to the database
    ///
    /// - Parameter person: Person object that will be added.
    func addPerson(person: Person) {
        try! realm.write {
            realm.add(person)
        }
    }
    
    /// Delete a person from the database.
    ///
    /// - Parameter person: Person object that will be deleted.
    func deletePerson(person: Person) {
        try! realm.write {
            realm.delete(person)
        }
    }
    
    /// Retrieve all the persons stored in the database.
    ///
    /// - Returns: Returns Realm Result all available Persons in the realm database.
    func retrievePersonObjects() -> Results<Person> {
        return realm.objects(Person.self).sorted(byKeyPath: "name")
    }
    
    // MARK: - Clothing
    
    /// Adds a clothing object to the database and then
    /// appends the clothing item to the Person's clothing list.
    ///
    /// - Parameters:
    ///   - person: Person object to which the clothing item will be appended to.
    ///   - clothing: The clothing object to add to the database.
    func addClothingToPerson(person: Person, clothing: Clothing) {
        try! realm.write {
            // Add clothing object to realm
            realm.add(clothing)
            
            // Append the clothing to the persons list
            person.clothing.append(clothing)
        }
    }
}
