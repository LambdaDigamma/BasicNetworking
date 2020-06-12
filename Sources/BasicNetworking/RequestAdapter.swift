//
//  RequestAdapter.swift
//  
//
//  Created by Lennart Fischer on 15.04.20.
//

import Foundation

public protocol RequestAdapter {
    func adapt(_ request: inout URLRequest)
    func beforeSend(_ request: URLRequest)
    func onResponse(response: URLResponse?, data: Data?)
    func onError(request: URLRequest, error: NetworkingError)
}

public extension RequestAdapter {
    func adapt(_ request: inout URLRequest) { }
    func beforeSend(_ request: URLRequest) { }
    func onResponse(response: URLResponse?, data: Data?) { }
    func onError(request: URLRequest, error: NetworkingError) { }
    func onSuccess(request: URLRequest) { }
}
