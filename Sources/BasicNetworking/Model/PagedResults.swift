//
//  PagedResults.swift
//  
//
//  Created by Lennart Fischer on 29.03.20.
//

import Foundation

struct PagedResults<T: Model>: Model {
    let page: Int
    let totalPages: Int
    let results: [T]
}

extension PagedResults {
    static var decoder: JSONDecoder { T.decoder }
}
