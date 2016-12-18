//
//  Student.swift
//  SavingDataExample
//
//  Created by Russell Gordon on 12/18/16.
//  Copyright © 2016 Russell Gordon. All rights reserved.
//

import UIKit

class Student : NSObject, NSCoding {
    
    // MARK: Properties
    var firstName : String
    var lastName : String
    
    // MARK: Paths for archiving data across sessions
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    static let ArchiveURL = DocumentsDirectory[0].appendingPathComponent("students")
    
    // MARK: Types
    struct PropertyKey {
        static let firstNameKey = "firstName"
        static let lastNameKey = "lastName"
    }
    
    init(firstName : String, lastName : String) {
        
        // Initialize stored properties
        self.firstName = firstName
        self.lastName = lastName
        
        // Run the initializer on the superclass
        super.init()
        
    }
    
    // MARK: NSCoding required functions
    
    // This allows the Meal class to save values
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: PropertyKey.firstNameKey)
        aCoder.encode(lastName, forKey: PropertyKey.lastNameKey)
    }
    
    // This allows the Meal class to load values from the file
    required convenience init?(coder aDecoder : NSCoder) {
        
        // Load the first name
        let firstName = aDecoder.decodeObject(forKey: PropertyKey.firstNameKey) as! String

        // Load the last name
        let lastName = aDecoder.decodeObject(forKey: PropertyKey.lastNameKey) as! String

        
        // Now call the designated (main) initializer for this class
        self.init(firstName: firstName, lastName: lastName)
        
    }
    
}
