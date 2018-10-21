//
//  EasyConstruction.swift
//  AutoObjectInit
//
//  Created by Петрічук Олег Аркадійовіч on 21.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import Foundation

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
