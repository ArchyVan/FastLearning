//
//  Request.swift
//  ProtocolNetwork
//
//  Created by Objective-C on 16/9/19.
//  Copyright © 2016年 Objective-C. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    associatedtype Response: Decodable
}

extension Request {
    var parameter : [String: Any] {
        return [:]
    }
}

protocol RequestSender {
    var host: String { get }
    func send<T: Request>(_ r: T,handler: @escaping (T.Response?) -> Void)
}

extension RequestSender {
    var host : String {
        return "http://www.api.com"
    }
}

protocol Decodable {
    static func parse(data: Data) -> Self?
}

struct URLSessionRequestSender: RequestSender {
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))!
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        // request.httpBody = ???
        
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            if let data = data, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async {
                    handler(res)
                }
            } else {
                DispatchQueue.main.async {
                    handler(nil)
                }
            }
        }
        task.resume()
    }
}
