//
//  PeopleTableViewController.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    var pc = PersonController()
    var ic = ImageController()
    
    var people: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Temporary! Will Delete
        pc.deleteAll()
        pc.createNewPerson(name: "Matthew", gender: .Male, picture: UIImage(named: "rhino"), clothingName: nil, clothingSize: nil)
        pc.createNewPerson(name: "April", gender: .Female, picture: nil, clothingName: "Pants", clothingSize: "12")
        pc.createNewPerson(name: "Beth", gender: .Female, picture: nil, clothingName: "Shirt", clothingSize: "2")

        // Populate the local array with realm results of people
        people = pc.retrieveStoredPersons()
        print(people)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell

        // Store the current person at row
        let person = people[indexPath.row]
        
        // Set name and image in cell
        cell.cellName.text = person.name
        cell.cellPicture.image = ic.convertDataToImage(data: person.pictureData)

        // Return the cell
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the person from realm
            pc.deletePerson(person: people[indexPath.row])
            people.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "PersonDetails" {
            if let vc = segue.destination as? PersonDetailsViewController {
                
                let cell = sender as! UITableViewCell
                let indexPath = tableView.indexPath(for: cell)
                
                vc.person = people[(indexPath?.row)!]
            }
        }

    }
}
