//
//  JsonDecoding.swift
//  NetworkPackage
//
//  Created by Abuzeid on 1/7/20.
//

import Foundation
public class JsonDecoder {
    public func docode<T: Decodable>(from data: Data) throws -> T {
        log(.info, String(data: data, encoding: .utf8))
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let model = try decoder.decode(T.self, from: data)
            return model
        } catch {
            log(.error, error)
            throw NetworkFailure.failedToParseData
        }
    }
}
