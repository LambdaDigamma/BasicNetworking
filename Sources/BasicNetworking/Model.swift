//
//  Model.swift
//  
//
//  Created by Lennart Fischer on 29.03.20.
//

import Foundation

public protocol Model: Codable {
    
    static var decoder: JSONDecoder { get }
    
    static var encoder: JSONEncoder { get }
    
}

public extension Model {
    
    static var decoder: JSONDecoder {
        
        let decoder = JSONDecoder()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd H:mm:ss"
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(formatter)

        return decoder
        
    }
    
    static var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
    
}

extension Array: Model where Element: Model {
    
    public static var decoder: JSONDecoder {
        return Element.decoder
    }
    
    public static var encoder: JSONEncoder {
        return Element.encoder
    }
    
}
