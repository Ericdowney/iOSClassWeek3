//
//  CollectionViewController.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/25/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
    }
}
