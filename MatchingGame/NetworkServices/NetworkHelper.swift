//
//  NetworkHelper.swift
//  MatchingGame
//
//  Created by Pritesh Nadiadhara on 5/12/20.
//  Copyright © 2020 PriteshN. All rights reserved.
//

import Foundation

public final class NetworkHelper {
  private init() {
    let cache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 10 * 1024 * 1024, diskPath: nil)
    URLCache.shared = cache
  }
  public static let shared = NetworkHelper()
  
  public func performDataTask(endpointURLString: String,
                              completionHandler: @escaping (AppError?, Data?, HTTPURLResponse?) ->Void) {
    guard let url = URL(string: endpointURLString) else {
      completionHandler(AppError.badURL("\(endpointURLString)"), nil, nil)
      return
    }
    var request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        completionHandler(AppError.networkError(error), nil, response as? HTTPURLResponse)
        return
      } else if let data = data {
        completionHandler(nil, data, response as? HTTPURLResponse)
      }
    }
    task.resume()
  }
}
