//
//  Request.swift
//  
//
//  Created by Lennart Fischer on 29.03.20.
//

import Foundation

public struct Request {
    
    public let builder: RequestBuilder
    public let completion: (Result<Data, NetworkingError>) -> Void

    init(builder: RequestBuilder, completion: @escaping (Result<Data, NetworkingError>) -> Void) {
        self.builder = builder
        self.completion = completion
    }
    
    public static func basic(method: HTTPMethod = .get,
                             prefix: PathPrefix? = nil,
                             path: String,
                             params: [URLQueryItem]? = nil,
                             completion: @escaping (Result<Data, NetworkingError>) -> Void) -> Request {
        
        let builder = BasicRequestBuilder(method: method, path: path, params: params)
        return Request(builder: builder, completion: completion)
        
    }
    
    public static func post<Body: Model>(method: HTTPMethod = .post,
                                         prefix: PathPrefix? = nil,
                                         path: String,
                                         params: [URLQueryItem]? = nil,
                                         body: Body?,
                                         completion: @escaping (Result<Data, NetworkingError>) -> Void) -> Request {
        
        let builder = PostRequestBuilder(method: method, path: path, params: params, body: body)
        return Request(builder: builder, completion: completion)
        
    }
    
}
