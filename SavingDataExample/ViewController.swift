//
//  ViewController.swift
//  SavingDataExample
//
//  Created by Russell Gordon on 12/18/16.
//  Copyright © 2016 Russell Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    // The list of first name text fields
    @IBOutlet var firstNames: [UITextField]!
    
    // The list of students (starts empty)
    var students : [Student] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a list of students (will be many students with no name to start)
        for _ in 0...14 {
            students.append( Student(firstName: "") )
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Iterate over all subviews of the main interface
        // For any that are text fields, make it so that when editing ends, the class list is saved
        // This works by invoking the saveClassList function
        for subview in self.view.subviews {
            if let textField = subview as? UITextField {
                textField.addTarget(self, action: #selector(self.saveClassList), for: .editingDidEnd)
            }
        }
    }
    
    // MARK: Respond to edits
    
    // This function will save any changes to the class list
    // It is called when any text field has a changed value
    func saveClassList() {
        
        // Iterate over all the first name text fields in the class list
        for (position, firstName) in firstNames.enumerated() {
            // If there is a non-nil value in the text field, modify the list of saved student names
            if let first = firstName.text {
                students[position].firstName = first
                print("\(position): \(first)")
            }
        }
    }

}

