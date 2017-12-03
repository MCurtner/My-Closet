//
//  PersonDetailsViewController.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var clothingTable: UITableView!
    
    var ic = ImageController()
    
    // The person object that is passed from the PeopleTableViewController.
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clothingTable.delegate = self
        clothingTable.dataSource = self
        
        // Display the picture data
        displayImage()
        
        nameLabel.text = person?.name
        
    }
    
    func displayImage() {
        picture.image = ic.convertDataToImage(data: person?.pictureData)
        ic.createImageCirle(imageView: picture)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension PersonDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (person?.clothing.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothingCell", for: indexPath) as! ClothingCell
        
        // Store the current person at row
        let clothingItem = person?.clothing[indexPath.row]
        
        // Set the clothing name and size in the cell
        cell.clothingItem.text = "\(clothingItem?.name ?? ""): \(clothingItem?.size ?? "")"

        // Return the cell
        return cell
    }
}
