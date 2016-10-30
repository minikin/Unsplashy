//
//  PhotoModel.swift
//  Unsplashy
//
//  Created by Sasha Prokhorenko on 10/30/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

struct Photo {
  let id: String
  let createdAt: String
  let width: Int
  let height: Int
  let color: String
}

extension Photo {
  init?(dictionary: JSONDictionary) {
    guard let id = dictionary["id"] as? String,
          let createdAt = dictionary["created_at"] as? String,
          let width = dictionary["width"] as? Int,
          let height = dictionary["height"] as? Int,
          let color = dictionary["color"] as? String else { return nil }
    self.id = id
    self.createdAt = createdAt
    self.width = width
    self.height = height
    self.color = color
  }
}


extension Photo {
  static let all = Resource<[Photo]>(url: baseURL, parseJSON: { json in
    guard let dictionaries = json as? [JSONDictionary] else { return nil }
    return dictionaries.flatMap(Photo.init)
  })
}
