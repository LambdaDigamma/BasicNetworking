//
//  APIClient.swift
//  
//
//  Created by Lennart Fischer on 19.06.20.
//

import Foundation

public struct APIClient {
    
    private let config: APIConfig
    private let session: URLSession
    private let queue: DispatchQueue
    
    private var adapters: [RequestAdapter]

    public static var defaultEncoder = JSONEncoder()
    public static var defaultDecoder = JSONDecoder()
    
    public init(config: APIConfig, urlSessionConfiguration: URLSessionConfiguration = .default, adapters: [RequestAdapter] = []) {
        
        self.session = URLSession(configuration: urlSessionConfiguration)
        self.config = config
        self.adapters = adapters
        self.queue = DispatchQueue(
            label: "AppNetworking",
            qos: .userInitiated,
            attributes: .concurrent
        )
        
    }
    
    public func send(request: Request) {
        
        queue.async {
            
            var urlRequest = request.builder.toURLRequest(baseURL: self.config.baseURL)

            self.adapters.forEach { $0.adapt(&urlRequest) }
            self.adapters.forEach { $0.beforeSend(urlRequest) }

            let task = self.session.dataTask(with: urlRequest) { (data, response, error) in
                self.adapters.forEach { $0.onResponse(response: response, data: data) }

                let result: Result<Data, NetworkingError>
                if let error = error {
                    result = .failure(.networkError(error))
                } else if let apiError = NetworkingError.error(from: response) {
                    result = .failure(apiError)
                } else {
                    result = .success(data ?? Data())
                }

                switch result {
                    case .success:
                        self.adapters.forEach { $0.onSuccess(request: urlRequest) }
                    case .failure(let error):
                        self.adapters.forEach { $0.onError(request: urlRequest, error: error) }
                }

                DispatchQueue.main.async {
                    request.completion(result)
                }
            }
            
            task.resume()
            
        }
        
    }
    
}
