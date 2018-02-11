//
//  Recipe.swift
//  Cook
//
//  Created by Tanveer Bashir on 2/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

class Recipe: Base {

    var publisher: String!
    var f2f_url: String!
    var title: String!
    var source_url: String!
    var recipe_id: String!
    var image_url: String!
    var social_rank: Double!
    var publisher_url: String!


    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        publisher       <- map["publisher"]
        f2f_url         <- map["f2f_url"]
        title           <- map["title"]
        source_url      <- map["source_url"]
        recipe_id       <- map["recipe_id"]
        image_url       <- map["image_url"]
        social_rank     <- map["social_rank"]
        publisher_url   <- map["publisher_url"]
    }
}
