//
//  TableViewCellCard.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 19/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class TableViewCellCard: UITableViewCell {
    @IBOutlet weak var valor: UILabel!
    @IBOutlet weak var reflexao: UILabel!
    @IBOutlet weak var view: UIView! {
        didSet {
            view.layer.cornerRadius = 5
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
