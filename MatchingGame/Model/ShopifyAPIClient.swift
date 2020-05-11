//
//  ShopifyAPIClient.swift
//  MatchingGame
//
//  Created by Pritesh Nadiadhara on 5/6/20.
//  Copyright © 2020 PriteshN. All rights reserved.
//

import UIKit

enum AppError {
    case badURL (String)
    case badData (Error)
    case badDecoding (Error)
}

final class ShopifyAPIClient {
    static func getAllProducts(completionHandler: @escaping ((ShopifyImageData?, AppError) -> Void)){
        guard let url = URL.init(string: "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6") else {
            completionHandler(nil, .badURL("URL Not Working"))
            return
            
        }
        
    }
}
