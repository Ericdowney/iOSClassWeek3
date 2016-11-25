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
    var data: [MyData]
    var dataCount: Int {
        return data.count
    }
    
    var selectedIndex: Int
    
    private init() {
        data = []
        selectedIndex = -1
    }
    
    // MARK: - Get / Create New Data
    
    func create(data: (name: String?, age: Int, description: String?)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "MyData", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        let obj = MyData(entity: entity, insertInto: ctx)
        obj.name = data.name
        obj.age = Int16(data.age)
        obj.dataDescription = data.description
        
        try? save()
    }
    
    func getData(from indexPath: IndexPath) -> (name: String?, age: Int, description: String?)? {
        guard let item = data.value(at: indexPath.row) else {
            return nil
        }
        return (item.name, Int(item.age), item.dataDescription)
    }
    
    func getSelectedData() -> (name: String?, age: Int, description: String?)? {
        guard let item = data.value(at: selectedIndex) else {
            return nil
        }
        return (item.name, Int(item.age), item.dataDescription)
    }
    
    // MARK: - Fetching Data
    
    func fetch<T: NSManagedObject>() -> [T] {
        var result: [T]? = nil
        managedObjectContext?.performAndWait { [weak self] in
            do {
                result = try self?.executeFetchRequest()
            }
            catch {
                print(error)
            }
        }
        return result ?? []
    }
    
    private func executeFetchRequest<T: NSManagedObject>() throws -> [T]? {
        let request = T.fetchRequest()
        return try request.execute() as? [T]
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}
