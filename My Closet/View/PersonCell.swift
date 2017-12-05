//
//  PersonCell.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var cellPicture: UIImageView!
    @IBOutlet weak var cellName: UILabel!

    private var ic = ImageController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ic.createImageCirle(imageView: cellPicture)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func createCellImageCirle() {
        cellPicture.layer.cornerRadius = cellPicture.frame.size.width/2
        cellPicture.layer.masksToBounds = true
        cellPicture.layer.borderWidth = 1.0
        cellPicture.layer.borderColor = UIColor.gray.cgColor
    }

}
