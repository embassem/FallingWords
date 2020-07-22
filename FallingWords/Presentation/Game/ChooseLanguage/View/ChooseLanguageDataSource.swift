//
//  ChooseLanguageDataSource.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class ChooseLanguageDataSource: NSObject, UICollectionViewDataSource, ListDataSource {

    private var datasourceCollectionView: UICollectionView!
    private var viewModel: ChooseLanguageViewModel!
    private override init() {}

    init(viewModel: ChooseLanguageViewModel, collectionView: UICollectionView) {
        super.init()
        self.viewModel = viewModel
        self.datasourceCollectionView = collectionView
    }

    func reload() {
        datasourceCollectionView.dataSource = self
        datasourceCollectionView.reloadData()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(for: section)
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: ChooseLanguageCell.self, for: indexPath)
        let item = viewModel.item(for: indexPath)
        cell.fill(with: item)
        return cell
    }
}
