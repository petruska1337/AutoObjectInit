### Clean architecture princeps
Accord to [clean architecture princeps](https://github.com/sergdort/CleanArchitectureRxSwift) platform objects shouldn't go beyond their module. For example CoreData objects should exist only in LocalStorage module, and service that works with CoreData should return plain, domain objects. More about this you can read [here.](https://github.com/sergdort/CleanArchitectureRxSwift)

### Problem
So developer should keep domain model, similar CoreData model and provide internal constructor for domain model which accept CoreData model

### Solution
In order not to write the same boring code again and again and accord to "lazy development" principles i decided to write [Sourcery](https://github.com/krzysztofzablocki/Sourcery) script which generate Domain model constructor with CoreData model

### Installation
Installation is basically the same as in any other soursery scripts, in addition you need to add EasyConstruction.swift file with extension helpers. If you are new to code generation i recommend you to start with reading about [it](https://www.raywenderlich.com/501-sourcery-tutorial-generating-swift-code-for-ios)
<details>
<summary>EasyConstruction.swift</summary>

```swift
public protocol EasyConstruction {
    static func new() -> Self
}
extension String: EasyConstruction {
    public static func new() -> String { return .init() }
}
extension Int: EasyConstruction {
    public static func new() -> Int { return .init() }
}
extension Double: EasyConstruction {
    public static func new() -> Double { return .init() }
}
extension UInt: EasyConstruction {
    public static func new() -> UInt { return .init() }
}
extension URL: EasyConstruction {
    public static func new() -> URL { return URL(string: "https://google.com")! }
}
extension Date: EasyConstruction {
    public static func new() -> Date { return .init() }
}
extension Bool: EasyConstruction {
    public static func new() -> Bool { return .init() }
}
extension Optional: EasyConstruction {
    public static func new() -> Wrapped? { return .none }
}
extension Array: EasyConstruction {
    public static func new() -> [Element] { return .init() }
}
extension Dictionary: EasyConstruction {
    public static func new() -> Dictionary<Key, Value> { return .init() }
}
```
</details>

### Example
**Input:**

Domain dog:
```Swift
public enum ToyType: String, CaseIterable {
    case training
    case boll
    case bone
}

public struct Toy {
    public let name: String
    public let type: ToyType
    public let isNew: Bool
}

public struct Dog {
    public let firstName: String
    public let lastName: String?
    public let age: Int
    public let birthday: Date
    public let photo: URL?
    public let favoriteToy: Toy
    public let toys: [Toy]
    public let parents: [String : String]
}
``` 

NSManagedObject dog:
```Swift
extension CDDog {
    @NSManaged public var age: Int32
    @NSManaged public var birthday: NSDate?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var photo: String?
    @NSManaged public var favoriteToy: CDToy?
    @NSManaged public var toys: NSSet?
}

extension CDToy {
    @NSManaged public var isNew: Bool
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var dog: CDDog?
    @NSManaged public var dogs: NSSet?
}
``` 

**Confirm to protocol:**

```Swift
public protocol AutoObjectInit: AutoInit {
    associatedtype CDObjectType
    var cdObject: CDObjectType { get }
}

extension Dog: AutoObjectInit {
    public var cdObject: CDDog.Type { return CDDog.self }
}

extension Toy: AutoObjectInit {
    public var cdObject: CDToy.Type { return CDToy.self }
}
``` 

**Outupt:**

```Swift
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
``` 

And now you can simply create plain dog with NSManagedObject dog:

```Swift
let dog = Dog.new(cdObject: cdDog)
``` 
You can try to experiment more after cloning example project, don't forget to `pod install`


### Known issue
Force unwrap for one to one relationship object

### Find this interesting?

You can contact with me olehpetruch@gmail.com
