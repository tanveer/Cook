//
//  ViewModel.swift
//  Cook
//
//  Created by Tanveer Bashir on 2/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    typealias Recipes = [Recipe]
    private var recipes: [Recipe] = []

    override init() {
        super.init()
    }

    func update(with recipes: Recipes) {
        self.recipes = recipes
    }
}

extension DataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        let recipe = recipes[indexPath.row]
        cell.recipe = recipe
        return cell
    }
}
