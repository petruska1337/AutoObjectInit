// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



import Foundation
import CoreData

public extension Dog {
    public static func new(cdObject: CDDog) -> Dog {
        return Dog.new(
            firstName: cdObject.firstName ?? .new(),
            lastName: cdObject.lastName,
            age: Int(cdObject.age),
            birthday: cdObject.birthday as Date? ?? .new(),
            photo: URL(string: cdObject.photo ?? ""),
            favoriteToy: Toy.new(cdObject: cdObject.favoriteToy!),
            toys: cdObject.toys?.allObjects as? [Toy] ?? .new(),
            parents: .new()
        )
    }
}
public extension Toy {
    public static func new(cdObject: CDToy) -> Toy {
        return Toy.new(
            name: cdObject.name ?? .new(),
            type: ToyType(rawValue: cdObject.type ?? .new())!,
            isNew: cdObject.isNew
        )
    }
}
