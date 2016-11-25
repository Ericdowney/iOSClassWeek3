//
//  DataDetailViewController.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/21/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class DataDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var ageLabel: UILabel?
    @IBOutlet var descriptionTextView: UITextView?
    
    var manager = DataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = manager.getSelectedData()
        nameLabel?.text = item?.name
        ageLabel?.text = "Age: \(item?.age ?? 0)"
        descriptionTextView?.text = item?.description
    }
    
}
