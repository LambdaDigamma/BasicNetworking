//
//  AuthResponse.swift
//  
//
//  Created by Lennart Fischer on 21.06.20.
//

import Foundation

public struct AuthResponse: Model {
    
    let tokenType: String
    let expiresIn: Int
    let accessToken: String
    let refreshToken: String
    
}
