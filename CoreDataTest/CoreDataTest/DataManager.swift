//
//  DataManager.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/21/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import CoreData

enum DataError: Error {
    case BadManagedObjectContext(String)
    case BadEntity(String)
}

class DataManager {
    
    static var shared: DataManager = DataManager()
    var managedObjectContext: NSManagedObjectContext?
    
    var data: [AnyObject]
    
    private init() {
        data = []
    }
    
    func set(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func create(data: (name: String?, age: Int, description: String?)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "MyData", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        // TODO: Implement Me!
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}
