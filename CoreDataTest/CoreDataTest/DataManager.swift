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
    
    var collections: [Collection]
    var collectionCount: Int {
        return collections.count
    }
    
    var myData: [MyData]
    var myDataCount: Int {
        return myData.count
    }
    
    var selectedCollectionIndex: Int
    var selectedMyDataIndex: Int
    
    private init() {
        collections = []
        myData = []
        selectedCollectionIndex = -1
        selectedMyDataIndex = -1
    }
}

extension DataManager {
    func loadCollectionData() {
        collections = fetch()
    }
    
    func create(collectionNamed name: String?) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "Collection", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        let obj = Collection(entity: entity, insertInto: ctx)
        obj.name = name
        
        try? save()
    }
    
    func getCollectionName(from indexPath: IndexPath) -> String? {
        return collections.value(at: indexPath.row)?.name
    }
}

extension DataManager {
    // MARK: - Get / Create New MyData
    func loadMyData() {
        let selectedCollection = collections.value(at: selectedCollectionIndex)
        myData = selectedCollection?.people?.flatMap { item in
            return item as? MyData
        } ?? []
    }
    
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
        obj.collection = collections.value(at: selectedCollectionIndex)
        
        try? save()
    }
    
    func getMyData(from indexPath: IndexPath) -> (name: String?, age: Int, description: String?)? {
        guard let item = myData.value(at: indexPath.row) else {
            return nil
        }
        return (item.name, Int(item.age), item.dataDescription)
    }
    
    func getSelectedMyData() -> (name: String?, age: Int, description: String?)? {
        guard let item = myData.value(at: selectedMyDataIndex) else {
            return nil
        }
        return (item.name, Int(item.age), item.dataDescription)
    }
}

extension DataManager {
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
