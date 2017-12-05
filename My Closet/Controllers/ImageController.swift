//
//  ImageController.swift
//  My Closet
//
//  Created by Matthew Curtner on 11/26/17.
//  Copyright © 2017 Matthew Curtner. All rights reserved.
//

import UIKit

class ImageController {
    
    // The default image to use if no image is provided
    private let DEFAULT_IMAGE: UIImage = UIImage(named: "default")!
    
    
    /// Convert the parameter UIImage; either a new image or the default image,
    /// to Data object for storage in Realm.
    ///
    /// - Parameter image: Optional UIImage
    /// - Returns: UIImagePNGRepresentation of the parameter UIImage or the default image
    func convertImageToData(image: UIImage?) -> Data {
        if image != nil {
            return UIImagePNGRepresentation(image!)!
        } else {
            return UIImagePNGRepresentation(DEFAULT_IMAGE)!
        }
    }
    
    /// Convert the stored image data back to a UIImage
    ///
    /// - Parameter data: Data object store in realm
    /// - Returns: UIImage
    func convertDataToImage(data: Data?) -> UIImage {
        if data != nil {
            return UIImage(data: data!)!
        } else {
            return DEFAULT_IMAGE
        }
    }
    
    /// Creates the outer image circle based on the image's width
    ///
    /// - Parameter imageView: UIImage to create the circle layer on.
    func createImageCirle(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
    }
}
