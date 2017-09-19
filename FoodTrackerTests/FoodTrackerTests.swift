//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Cristina Curcelli on 9/13/17.
//
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: Breed Class Tests
    
    // Confirm that the Breed initializer returns a Breed object when given valid parameters.
    func testBreedInitializationSucceeds(){
        
        // Zero rating
        let zeroRatingBreed = Breed.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingBreed)
        
        // Highest positive rating
        let positiveRatingBreed = Breed.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingBreed)
    }
    
    func testBreedInitializationFails(){
        
        // Negative rating
        let negativeRatingBreed = Breed.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingBreed)
        
        // Empty string
        let emptyStringBreed = Breed.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringBreed)
        
        // Rating exceeds maximum
        let largeRatingBreed = Breed.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingBreed)
    }
}
