//
//  Ingredient.swift
//  Cook
//
//  Created by Tanveer Bashir on 2/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

class Ingredient: Mappable {

    var ingredients: [String]!
    var publisher: String!
    var f2f_url: String!
    var source_url: String!
    var recipe_id: String!
    var image_url: String!
    var social_rank: Double!
    var publisher_url: String!
    var title: String!

    required init?(map: Map) {}

    func mapping(map: Map) {
        title           <- map["recipe.title"]
        ingredients     <- map["recipe.ingredients"]
        publisher       <- map["recipe.publisher"]
        f2f_url         <- map["recipe.f2f_url"]
        source_url      <- map["recipe.source_url"]
        recipe_id       <- map["recipe.recipe_id"]
        image_url       <- map["recipe.image_url"]
        social_rank     <- map["recipe.social_rank"]
        publisher_url   <- map["recipe.publisher_url"]
    }
}
