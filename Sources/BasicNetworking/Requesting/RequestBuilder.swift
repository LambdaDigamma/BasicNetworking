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
    var prefix: PathPrefix? { get }
    var path: String { get }
    var params: [URLQueryItem]? { get }
    var headers: [String: String] { get }

    func toURLRequest(baseURL: URL) -> URLRequest
    
    func encodeRequestBody() -> Data?
    
}

public extension RequestBuilder {
    
    func encodeRequestBody() -> Data? { nil }
    
    func toURLRequest(baseURL: URL) -> URLRequest {
        
        var components = URLComponents(url: baseURL.appendingPathComponent(prefix ?? "").appendingPathComponent(path),
                                       resolvingAgainstBaseURL: false)!
        components.queryItems = params
        let url = components.url!

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(Bundle.main.preferredLocalizations.first ?? "en", forHTTPHeaderField: "Accept-Language")
        request.httpMethod = method.rawValue.uppercased()

        request.httpBody = encodeRequestBody()
        
        return request
        
    }
    
}
