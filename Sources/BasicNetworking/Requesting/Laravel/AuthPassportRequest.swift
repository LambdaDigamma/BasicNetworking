//
//  AuthPassportRequest.swift
//  
//
//  Created by Lennart Fischer on 19.06.20.
//

import Foundation

public struct AuthPassportRequest {
    
    public static func register(name: String? = nil, email: String, password: String, _ completion: @escaping (Result<GenericResponse, NetworkingError>) -> Void) -> Request {
        
        struct Body: Model {
            let name: String?
            let email: String
            let password: String
        }

        let body = Body(name: name, email: email, password: password)

        return Request.post(path: "auth/register", body: body) { (result: Result<Data, NetworkingError>) in
            result.decoding(GenericResponse.self, completion: completion)
        }
        
    }
    
    public static func login(email: String, password: String, clientID: Int, clientSecret: String,  _ completion: @escaping (Result<AuthResponse, NetworkingError>) -> Void) -> Request {
        
        struct Body: Model {
            let grantType: String = "password"
            let username: String
            let password: String
            let clientID: Int
            let clientSecret: String
            let scope: String = "*"
        }
        
        let body = Body(username: email, password: password, clientID: clientID, clientSecret: clientSecret)
        
        return Request.post(path: "oauth/token", body: body) { (result: Result<Data, NetworkingError>) in
            result.decoding(AuthResponse.self, completion: completion)
        }
        
    }
    
}
