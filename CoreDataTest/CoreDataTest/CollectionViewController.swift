//
//  CollectionViewController.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/25/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var collectionTableView: UITableView?
    
    var manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.loadCollectionData()
        collectionTableView?.reloadData()
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.collectionCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = manager.getCollectionName(from: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
        manager.selectedCollectionIndex = indexPath.row
    }
}
