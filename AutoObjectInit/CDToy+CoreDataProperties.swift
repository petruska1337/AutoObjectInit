//
//  CDToy+CoreDataProperties.swift
//  AutoObjectInit
//
//  Created by Петрічук Олег Аркадійовіч on 20.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//
//

import Foundation
import CoreData


extension CDToy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDToy> {
        return NSFetchRequest<CDToy>(entityName: "CDToy")
    }

    @NSManaged public var isNew: Bool
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var dog: CDDog?
    @NSManaged public var dogs: NSSet?

}

// MARK: Generated accessors for dogs
extension CDToy {

    @objc(addDogsObject:)
    @NSManaged public func addToDogs(_ value: CDDog)

    @objc(removeDogsObject:)
    @NSManaged public func removeFromDogs(_ value: CDDog)

    @objc(addDogs:)
    @NSManaged public func addToDogs(_ values: NSSet)

    @objc(removeDogs:)
    @NSManaged public func removeFromDogs(_ values: NSSet)

}
