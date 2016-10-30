//
//  UnsplashAPI.swift
//  Unsplashy
//
//  Created by Sasha Prokhorenko on 10/30/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import Foundation

enum UnsplashyErrors: Error {
  case unsplashyFailed(reason: String)
}


let base = "https://api.unsplash.com/photos?client_id="
let path = Bundle.main.path(forResource: "UnsplashKeys", ofType: "plist")
let dict = NSDictionary(contentsOfFile: path!)
let applicationID = dict!.object(forKey: "applicationID") as! String
let baseURL = URL(string: base + applicationID + "&page=17&per_page=40")!
