//
//  ImageController.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class ImageController {
    
    let DEFAULT_IMAGE: UIImage = UIImage(named: "default")!
    
    func convertImageToData(image: UIImage?) -> Data {
        if image != nil {
            return UIImagePNGRepresentation(image!)!
        } else {
            return UIImagePNGRepresentation(DEFAULT_IMAGE)!
        }
    }
    
    func convertDataToImage(data: Data?) -> UIImage {
        if data != nil {
            return UIImage(data: data!)!
        } else {
            return DEFAULT_IMAGE
        }
    }
    
    func createImageCirle(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
    }
}
