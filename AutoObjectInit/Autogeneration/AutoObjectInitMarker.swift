//
//  AppDelegate.swift
//  SourceryRandom
//
//  Created by Петрічук Олег Аркадійовіч on 23.09.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

// extend you models with AutoObjectInit marker here (or in any other place if you want)

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
