//
//  MyData+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/25/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation
import CoreData

extension MyData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyData> {
        return NSFetchRequest<MyData>(entityName: "MyData");
    }

    @NSManaged public var age: Int16
    @NSManaged public var dataDescription: String?
    @NSManaged public var name: String?
    @NSManaged public var collection: Collection?

}
