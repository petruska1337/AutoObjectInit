//
//  CDDog+CoreDataProperties.swift
//  AutoObjectInit
//
//  Created by Петрічук Олег Аркадійовіч on 20.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//
//

import Foundation
import CoreData


extension CDDog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDog> {
        return NSFetchRequest<CDDog>(entityName: "CDDog")
    }

    @NSManaged public var age: Int32
    @NSManaged public var birthday: NSDate?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var photo: String?
    @NSManaged public var favoriteToy: CDToy?
    @NSManaged public var toys: NSSet?

}

// MARK: Generated accessors for toys
extension CDDog {

    @objc(addToysObject:)
    @NSManaged public func addToToys(_ value: CDToy)

    @objc(removeToysObject:)
    @NSManaged public func removeFromToys(_ value: CDToy)

    @objc(addToys:)
    @NSManaged public func addToToys(_ values: NSSet)

    @objc(removeToys:)
    @NSManaged public func removeFromToys(_ values: NSSet)

}
