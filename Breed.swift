//
//  Breed.swift
//  FoodTracker
//
//  Created by Cristina Curcelli on 9/17/17.
//
//

import UIKit
import os.log

class Breed: NSObject, NSCoding { // since NSObject only has init initializer do not need to add
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("breeds")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    //Note: This is a failable initializer, thus the optional (needs to be unwrapped later) 
    init?(name: String, photo: UIImage?, rating: Int){
        // Initialization should fail if 1) name is empty or 2) the rating is negative.

        // Name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5, inclusive.
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Breed object.", log: OSLog.default, type: .debug)
            return nil
        }
        // Because photo is an optional property of Breed, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage //fixed to update
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating) //fixed to update
        
        self.init(name: name, photo: photo, rating: rating)
    }
}
