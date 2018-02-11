//
//  RecipeCell.swift
//  Cook
//
//  Created by Tanveer Bashir on 2/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit
import Kingfisher

class RecipeCell: UICollectionViewCell {

    var recipe: Recipe? {
        didSet {
            if let recipe = recipe {
                titleLabel.text = recipe.title
                recipeImage.kf.setImage(with: URL(string: recipe.image_url))
            }
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var recipeImage: UIImageView!
}
