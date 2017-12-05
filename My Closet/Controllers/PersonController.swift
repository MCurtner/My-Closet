//
//  PersonController.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class PersonController {
    
    // Create an instance of the RealmManager
    private var rm = RealmManager()
    
    // Create an instance of the ImageController
    private var imageController = ImageController()
    
    // Create an instance of the ClothingController
    private var cc = ClothingController()
    
    // MARK: - Person - Creation
    /// Creates and stores a new person in the database.
    ///
    /// - Parameters:
    ///   - name: Name of the person
    ///   - gender: Gender of the person
    ///   - picture: Optional picture image
    ///   - clothingName: Optional clothing name
    ///   - clothingSize: Optional clothing size
    func createNewPerson(name: String, gender: Gender, picture: UIImage?, clothingName: String?, clothingSize: String?) {
        let person: Person = Person()
        
        person.name = name
        person.gender = gender.rawValue
        person.pictureData = imageController.convertImageToData(image: picture)
        
        storeClothingForPerson(person: person, clothingName: clothingName, clothingSize: clothingSize)
        
        rm.addPerson(person: person)
    }
    
    // MARK: - Person - Deletion
    
    /// Temporary function that deletes everything.  Will delete.
    func deleteAll() {
        rm.deleteRealms()
    }
    
    /// Delete the specified person object from the database.
    ///
    /// - Parameter person: Person object to delete
    func deletePerson(person: Person) {
        rm.deletePerson(person: person)
    }
    
    // MARK: - Person - Retrieval
    
    /// Retrieves the stored persons in the database and stores
    /// the results in an array of type Person.
    ///
    /// - Returns: An array of persons
    func retrieveStoredPersons() -> Array<Person> {
        return Array(rm.retrievePersonObjects())
    }
    
    // MARK: - Person - Clothing
    
    /// Creates and stores a new cloting object in the database
    /// that is linked to a person.
    ///
    /// - Parameters:
    ///   - person: Person object which will have the clothing item(s)
    ///   - clothingName: Optional Clothing Name
    ///   - clothingSize: Optional Clothing Size
    func storeClothingForPerson(person: Person, clothingName: String?, clothingSize: String?) {
        // If the clothing size ans name are not nil, save the clothing object.
        if clothingName != nil && clothingSize != nil {
            let clothing = cc.createNewClothing(name: clothingName!, size: clothingSize!)
            rm.addClothingToPerson(person: person, clothing: clothing)
        }
    }
}
