//
//  Result+Extensions.swift
//  
//
//  Created by Lennart Fischer on 29.03.20.
//

import Foundation

public extension Result where Success == Data, Failure == NetworkingError {
    
    func decoding<M: Model>(_ model: M.Type, completion: @escaping (Result<M, NetworkingError>) -> Void) {

        DispatchQueue.global().async {
            
            let result = self.flatMap { data -> Result<M, NetworkingError> in
                do {
                    let decoder = M.decoder
                    let model = try decoder.decode(M.self, from: data)
                    return .success(model)
                } catch let e as DecodingError {
                    return .failure(.decodingError(e))
                } catch {
                    return .failure(NetworkingError.unhandledResponse)
                }
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }
        
    }
    
}
