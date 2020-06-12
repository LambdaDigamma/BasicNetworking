//
//  NetworkingError.swift
//  
//
//  Created by Lennart Fischer on 12.06.20.
//

import Foundation

public enum NetworkingError: Error {
    
    case unprocessableEntity(errorBag: ErrorBag?)
    case unknownResponse
    case networkError(Error)
    case requestError(Int)
    case serverError(Int)
    case decodingError(DecodingError)
    case unhandledResponse
    
}
