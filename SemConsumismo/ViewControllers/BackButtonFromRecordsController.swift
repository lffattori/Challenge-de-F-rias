//
//  ViewControllerHistoricoPage.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 18/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class BackButtonFromRecordsController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
