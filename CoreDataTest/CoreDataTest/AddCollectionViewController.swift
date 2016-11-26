//
//  AddCollectionViewController.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/25/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class AddCollectionViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?
    
    var manager = DataManager.shared
    
    @IBAction func add() {
        try? manager.create(collectionNamed: nameField?.text)
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}
