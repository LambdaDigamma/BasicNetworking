//
//  APIPrefix.swift
//  
//
//  Created by Lennart Fischer on 21.06.20.
//

import Foundation

public typealias PathPrefix = String

extension PathPrefix {
    
    public static var api: PathPrefix = "api"
    public static var v1: PathPrefix = "v1"
    public static var v2: PathPrefix = "v2"
    
    public static func combine(components: PathPrefix...) -> PathPrefix {
        return components.joined(separator: "/").appending("/")
    }
    
}
