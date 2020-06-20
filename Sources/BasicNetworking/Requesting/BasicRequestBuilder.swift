//
//  BasicRequestBuilder.swift
//  
//
//  Created by Lennart Fischer on 29.03.20.
//

import Foundation


struct BasicRequestBuilder: RequestBuilder {
    
    var method: HTTPMethod
    var path: String
    var params: [URLQueryItem]?
    var headers: [String : String] = [:]
    
}
