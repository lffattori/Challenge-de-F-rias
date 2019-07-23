//
//  TableViewCell.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 19/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import Foundation
import UIKit

public class ReflexaoTableViewCell:UITableViewCell{
    @IBOutlet weak var card: CardView!
    var reflexoes:UILabel {
        get {
            return card.lblReflexoes
        }
    }
    var valor:UILabel {
        get {
            return card.lblValor
        }
    }
    
}

public class CardView:UIView {
    @IBOutlet var lblReflexoes:UILabel!
    @IBOutlet var lblValor:UILabel!
    
    public override func awakeFromNib() {
        self.layer.cornerRadius = 20
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
}
