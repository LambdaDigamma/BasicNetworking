//
//  PostRequestBuilder.swift
//  
//
//  Created by Lennart Fischer on 15.04.20.
//

import Foundation

struct PostRequestBuilder<Body: Model>: RequestBuilder {
    
    var method: HTTPMethod
    var baseURL: URL
    var path: String
    var params: [URLQueryItem]?
    var headers: [String : String] = [:]
    var body: Body?
    
    init(method: HTTPMethod = .post,
         baseURL: URL,
         path: String,
         params: [URLQueryItem]? = nil,
         body: Body? = nil) {
        self.method = method
        self.baseURL = baseURL
        self.path = path
        self.params = params
        self.body = body
    }
    
    func encodeRequestBody() -> Data? {
        
        guard let body = body else { return nil }

        do {
            let encoder = Body.encoder
            return try encoder.encode(body)
        } catch {
            print("Error encoding request body: \(error)")
            return nil
        }
        
    }
    
}
