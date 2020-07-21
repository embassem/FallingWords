//
//  LanguageGameViewController.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class LanguageGameViewController: NiblessViewController {

    let viewModel: LanguageGameViewModel

    lazy var backButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        btn.setImage(UIImage(named: "ic_back"), for: [])
        btn.addTarget(self, action: #selector(backButtonWasTapped), for: .touchUpInside)
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        let top: NSLayoutConstraint
        let leading: NSLayoutConstraint
        if #available(iOS 11.0, *) {
            top = btn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8)
            leading = btn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        } else {
            top = btn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25)
            leading = btn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12)
        }
        NSLayoutConstraint.activate([top, leading])

        return btn
    }()

    // MARK: - Methods
    public init(_ viewModel: LanguageGameViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        view.backgroundColor = UIColor.background
        view.bringSubviewToFront(backButton)
        bind(to: viewModel)
    }

    private func bind(to viewModel: LanguageGameViewModel) {
    }

    @objc
    func backButtonWasTapped() {
        navigationController?.popViewController(animated: true)
    }
}
