//
//  AddDataViewController.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/21/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class AddDataViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var ageField: UITextField?
    @IBOutlet var descriptionView: UITextView?
    
    let manager = DataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func add() {
        try? manager.create(data: (nameField?.text, ageField?.text?.integer ?? 0, descriptionView?.text))
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}


extension String {
    var integer: Int? {
        return Int(self)
    }
}
