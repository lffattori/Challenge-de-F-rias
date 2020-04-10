//
//  TableViewCell.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 19/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import Foundation
import UIKit

public class ReflexionCell:UITableViewCell{
    @IBOutlet weak var card: CardView!
    
    var reflexion: UILabel {
        get {
            return card.lblReflexion
        }
    }
    var cost: UILabel {
        get {
            return card.lblCost
        }
    }

}

public class CardView: UIView {
    @IBOutlet var lblReflexion: UILabel!
    @IBOutlet var lblCost: UILabel!
    
    
    public override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 0.6794734589)
    }
}
