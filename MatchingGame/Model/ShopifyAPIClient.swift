//
//  ShopifyAPIClient.swift
//  MatchingGame
//
//  Created by Pritesh Nadiadhara on 5/6/20.
//  Copyright © 2020 PriteshN. All rights reserved.
//

import UIKit

public enum AppError: Error {
    case badURL(String)
    case networkError(Error)
    case noResponse
    case decodingError(Error)
    case badStatusCode(String)
    case badMimeType(String)
    
    public func errorMessage() -> String {
        switch self {
        case .badURL(let message):
            return "badURL: \(message)"
        case .networkError(let error):
            return error.localizedDescription
        case .noResponse:
            return "no network response"
        case .decodingError(let error):
            return "decoding error: \(error)"
        case .badStatusCode(let message):
            return "bad status code: \(message)"
        case .badMimeType(let mimeType):
            return "bad mime type: \(mimeType)"
        }
    }
}

final class ShopifyAPIClient {
    
    static func getAllProducts(completionHandler: @escaping (AppError?, [Products]?) -> Void)
    {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6#") { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError,nil)
            }
            guard let response = httpResponse,
                (200...299).contains(response.statusCode) else {
                    let statusCode = httpResponse?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
                    return
            }
            if let data = data {
              do {
                let shopifyImageData = try JSONDecoder().decode(ShopifyImageData.self, from: data)
                let products = shopifyImageData.products
                completionHandler(nil, products)
              } catch {
                completionHandler(AppError.decodingError(error), nil)
              }
            }
        }
        
        
        
    }
}
