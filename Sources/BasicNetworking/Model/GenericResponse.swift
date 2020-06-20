//
//  GenericResponse.swift
//  
//
//  Created by Lennart Fischer on 19.06.20.
//

import Foundation

public struct GenericResponse: Model {
    let statusCode: Int
    let statusMessage: String
}
