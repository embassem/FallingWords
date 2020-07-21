//
//  ChooseLanguageViewController.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class ChooseLanguageViewController: BaseViewController {

    convenience init(viewModel: ChooseLanguageViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    var coordinator: AppCoordinatorProtocol!

    private var viewModel: ChooseLanguageViewModel!
    let searchController = UISearchController(searchResultsController: nil)

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
    }

    private func bind(to viewModel: ChooseLanguageViewModel) {
        viewModel.error.observe(on: self) { [weak self] in self?.showError(with: $0) }
    }
}
