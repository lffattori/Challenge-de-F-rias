//
//  ViewControllerRespostas.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 18/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class EndOfBreakeImpulseQuiz: UIViewController {
    
    @IBAction func doneButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)

    }
}
