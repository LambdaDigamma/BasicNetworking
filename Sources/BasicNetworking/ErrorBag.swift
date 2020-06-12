//
//  ErrorBag.swift
//  
//
//  Created by Lennart Fischer on 12.06.20.
//

import Foundation

public struct ErrorBag: Equatable, Codable {
    
    public var message: String
    public var errors: [String: [String]]
    
}
