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
    
    var ic = ImageController()
    
    
    // The person object that is passed from the PeopleTableViewController.
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
