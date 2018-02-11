//
//  Base.swift
//  Cook
//
//  Created by Tanveer Bashir on 2/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

class Base: Mappable {

    var recipes: [Recipe]!

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        recipes     <- map["recipes"]
    }
}

