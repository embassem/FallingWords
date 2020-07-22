//
//  ChooseLanguageViewController.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

protocol ListDataSource {
    func reload()
}

class ChooseLanguageViewController: BaseViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    convenience init(viewModel: ChooseLanguageViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    var coordinator: AppCoordinatorProtocol!

    private var viewModel: ChooseLanguageViewModel!

    lazy var listDataSource: ListDataSource = {
        return ChooseLanguageDataSource(viewModel: self.viewModel, collectionView: self.collectionView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func configureUI() {

        title = viewModel.screenTitle
        bind(to: viewModel)
        viewModel.viewDidLoad()
        definesPresentationContext = true
        collectionView.register(nibWithCellClass: ChooseLanguageCell.self)
        collectionView.delegate = self
    }

    private func bind(to viewModel: ChooseLanguageViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.listDataSource.reload() }
        viewModel.error.observe(on: self) { [weak self] in self?.showError(with: $0) }
    }
}

extension ChooseLanguageViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let collectionFlow = collectionView.collectionViewLayout as?
            UICollectionViewFlowLayout else { return .zero }
        let space: CGFloat =
            (collectionFlow.minimumInteritemSpacing) +
                (collectionFlow.sectionInset.left) +
                (collectionFlow.sectionInset.right)

        return CGSize(width: ((collectionView.frame.size.width - space) / 2), height: 120)
    }
}
