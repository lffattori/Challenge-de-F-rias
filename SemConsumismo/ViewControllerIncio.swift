//
//  ViewControllerIncio.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 18/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class ViewControllerIncio: UIViewController {
    var acesso:Bool = false

    override func viewDidAppear(_ animated: Bool) {
        if !acesso {
            let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)
            if let tutorial = storyboard.instantiateViewController(withIdentifier: "tutorial")
                as? ViewControllerTutorial{
                present(tutorial, animated: true, completion: nil)
            }
            acesso = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
