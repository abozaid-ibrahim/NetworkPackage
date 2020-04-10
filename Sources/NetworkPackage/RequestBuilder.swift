//
//  RequestBuilder.swift
//  NetworkPackage
//
//  Created by abuzeid on 11/19/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation

public protocol RequestBuilder {
    var baseURL: String { get }
    var method: HttpMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
    var bodyParamters: [String: Any] {get}
}

public enum HttpMethod: String {
    case get, post,PUT,DELETE,PATCH
}

extension RequestBuilder {
    var description: String {
        return "\(endpoint), params: \(parameters), headers: \(headers)"
    }

    var endpoint: URL {
        return URL(string: "\(baseURL)\(path)")!
    }

    var baseURL: String {
        return APIConstants.baseURL
    }

    var task: URLRequest {
        var items = [URLQueryItem]()
        var myURL = URLComponents(string: endpoint.absoluteString)
        for (key, value) in parameters {
            items.append(URLQueryItem(name: key, value: "\(value)"))
        }
        myURL?.queryItems = items
        var request = URLRequest(url: myURL!.url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: APIConstants.timeout)
        request.httpMethod = method.rawValue
        switch method {
        case .get:
            break
        default:
            let jsonData = try? JSONSerialization.data(withJSONObject: bodyParamters)
            request.httpBody = jsonData
        }
        request.allHTTPHeaderFields = request.allHTTPHeaderFields?.merging(headers, uniquingKeysWith: { (_, newK) -> String in
            newK
        })
        return request
    }
}
