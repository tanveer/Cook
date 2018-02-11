//
//  Constant.swift
//  Cook
//
//  Created by Tanveer Bashir on 2/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

struct Constant {
    static let params = ["key": key] // get an api key from http://food2fork.com/about/api
    static var bsaeUrl: URL {
        return URL(string: "http://food2fork.com/api/search?")!
    }
}
