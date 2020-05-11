//
//  ShopifyImageData.swift
//  MatchingGame
//
//  Created by Pritesh Nadiadhara on 5/9/20.
//  Copyright © 2020 PriteshN. All rights reserved.
//

import Foundation

struct ShopifyImageData: Decodable {
    let products : [Products]
}

struct Products : Decodable {
    let images : Images
}

struct Images : Decodable {
    let src : String?
}
