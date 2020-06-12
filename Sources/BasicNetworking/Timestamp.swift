//
//  Timestamp.swift
//  
//
//  Created by Lennart Fischer on 12.06.20.
//

import Foundation

public protocol Timestamp {
    
    var createdAt: Date? { get set }
    var updatedAt: Date? { get set }
    
}
