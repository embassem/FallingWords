//
//  ChooseLanguageCell.swift
//  FallingWords
//
//  Created by Bassem Abbas on 7/22/20.
//  Copyright © 2020 Bassem Abbas. All rights reserved.
//

import UIKit

class ChooseLanguageCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var fromLabel: UILabel!
    @IBOutlet private weak var toLabel: UILabel!

    var item: ChooseLanguageItemViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = false
    }

    func fill(with model: ChooseLanguageItemViewModel) {
        self.item = model
        self.fromLabel.text = model.fromLang
        self.toLabel.text = model.toLang
    }
}
