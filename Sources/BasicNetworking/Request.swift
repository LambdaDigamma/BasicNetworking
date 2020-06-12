//
//  Request.swift
//  
//
//  Created by Lennart Fischer on 29.03.20.
//

import Foundation

public struct Request {
    
    let builder: RequestBuilder
    let completion: (Result<Data, NetworkingError>) -> Void

    init(builder: RequestBuilder, completion: @escaping (Result<Data, NetworkingError>) -> Void) {
        self.builder = builder
        self.completion = completion
    }
    
    public static func basic(method: HTTPMethod = .get,
                             baseURL: URL, path: String,
                             params: [URLQueryItem]? = nil,
                             completion: @escaping (Result<Data, NetworkingError>) -> Void) -> Request {
        
        let builder = BasicRequestBuilder(method: method, baseURL: baseURL, path: path, params: params)
        return Request(builder: builder, completion: completion)
        
    }
    
    public static func post<Body: Model>(method: HTTPMethod = .post,
                                         baseURL: URL, path: String,
                                         params: [URLQueryItem]? = nil,
                                         body: Body?,
                                         completion: @escaping (Result<Data, NetworkingError>) -> Void) -> Request {
        
        let builder = PostRequestBuilder(method: method,
                                         baseURL: baseURL,
                                         path: path,
                                         params: params,
                                         body: body)
        
        return Request(builder: builder, completion: completion)
        
    }
    
}
