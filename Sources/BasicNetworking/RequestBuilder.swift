//
//  RequestBuilder.swift
//  
//
//  Created by Lennart Fischer on 15.04.20.
//

import Foundation


public enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

public protocol RequestBuilder {
    
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var params: [URLQueryItem]? { get }
    var headers: [String: String] { get }

    func toURLRequest() -> URLRequest
    
    func encodeRequestBody() -> Data?
    
}

public extension RequestBuilder {
    
    func encodeRequestBody() -> Data? { nil }
    
    func toURLRequest() -> URLRequest {
        
        var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                       resolvingAgainstBaseURL: false)!
        components.queryItems = params
        let url = components.url!

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue.uppercased()

        request.httpBody = encodeRequestBody()
        
        return request
        
    }
    
}
