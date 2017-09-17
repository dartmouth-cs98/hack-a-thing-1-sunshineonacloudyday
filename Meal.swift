//
//  Meal.swift
//  FoodTracker
//
//  Created by Cristina Curcelli on 9/17/17.
//
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
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
}
