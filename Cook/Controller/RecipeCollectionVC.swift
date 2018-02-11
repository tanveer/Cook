//
//  RecipeCollectionVC.swift
//  Cook
//
//  Created by Tanveer Bashir on 2/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit


class RecipeCollectionVC: UIViewController {

    private let columns: CGFloat = 1
    private let inset: CGFloat = 8
    private let spacing: CGFloat = 4
    private let lineSpacing: CGFloat = 8
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    private var searchController = UISearchController(searchResultsController: nil)
    private var client = API()
    private var dataSource = DataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        setSearchBar()
        collectionView.dataSource = dataSource

        downloadRecipe()
    }

    private func setSearchBar() {
        containerView.addSubview(searchController.searchBar)
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
    }

    private func downloadRecipe() {
        client.fetchRecipe(onSuccess: { [weak self] recipes in
            self?.dataSource.update(with: recipes)
            self?.collectionView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}

extension RecipeCollectionVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let query = searchController.searchBar.text, query != "" {
            client.searchRecipe(for: query, onSuccess: { [weak self] (recipes) in
                self?.dataSource.update(with: recipes)
                self?.collectionView.reloadData()
            }, onFailure: { (error) in
                print(error.localizedDescription)
            })
        }
    }
}

extension RecipeCollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width / columns) - (inset + spacing)
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset , bottom: inset, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
}
