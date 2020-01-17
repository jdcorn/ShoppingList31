//
//  ItemTableViewCell.swift
//  ShoppingList31
//
//  Created by Jon Corn on 1/17/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

protocol ItemTableViewCellDelegate: class {
    func isPurchasedToggled(_ sender: ItemTableViewCell)
}

class ItemTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    weak var delegate: ItemTableViewCellDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var isPurchasedButton: UIButton!
    
    // MARK: - Actions
    @IBAction func isPurchasedButtonTapped(_ sender: Any) {
        delegate?.isPurchasedToggled(self)
    }
    
    // MARK: - Functions
    func updateViews(item: Item) {
        itemNameLabel.text = item.name
        if item.isPurchased {
            isPurchasedButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            isPurchasedButton.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
        }
    }
}
