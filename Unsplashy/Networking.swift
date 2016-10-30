//
//  Networking.swift
//  Unsplashy
//
//  Created by Sasha Prokhorenko on 10/30/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import Foundation

struct Resource<A> {
  let url: URL
  let parse: (Data) -> A?
}

extension Resource {
  init(url: URL, parseJSON: @escaping (AnyObject) -> A?) {
    self.url = url
    print(url)
    self.parse = { data in
      let json = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject
      return json.flatMap(parseJSON)
    }
  }
}

final class UnsplashWebservice {
  func load<A>(_ resource: Resource<A>, completion: @escaping (A?) -> ()) {
    URLSession.shared.dataTask(with: resource.url) { data, _, _ in
      guard let data = data else {
        completion(nil)
        return
      }
      completion(resource.parse(data))
      }.resume()
  }
}
