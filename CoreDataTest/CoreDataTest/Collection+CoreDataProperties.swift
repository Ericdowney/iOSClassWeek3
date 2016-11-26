//
//  Collection+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/25/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation
import CoreData

extension Collection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collection> {
        return NSFetchRequest<Collection>(entityName: "Collection");
    }

    @NSManaged public var name: String?
    @NSManaged public var people: NSSet?

}

// MARK: Generated accessors for people
extension Collection {

    @objc(addPeopleObject:)
    @NSManaged public func addToPeople(_ value: MyData)

    @objc(removePeopleObject:)
    @NSManaged public func removeFromPeople(_ value: MyData)

    @objc(addPeople:)
    @NSManaged public func addToPeople(_ values: NSSet)

    @objc(removePeople:)
    @NSManaged public func removeFromPeople(_ values: NSSet)

}
