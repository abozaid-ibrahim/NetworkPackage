//
//  XEndpoint.swift
//  NetworkPackage
//
//  Created by Abuzeid on 1/7/20.
//

import Foundation
enum XEndpoint {
    case login
}

extension XEndpoint: RequestBuilder {
    var headers: [String : String] {
        return [:] 
    }
    
    var method: HttpMethod {
        return .get
    }

    var path: String {
        return "login"
    }

    var parameters: [String: Any] {
        return [:]
    }
}
