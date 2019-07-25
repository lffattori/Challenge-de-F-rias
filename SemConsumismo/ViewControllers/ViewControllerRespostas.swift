//
//  ViewControllerRespostas.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 18/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class ViewControllerRespostas: UIViewController {
    
    @IBAction func botaoPronto(_ sender: Any) {
//                navigationController?.popViewController(animated: true)
//                let controllers = self.navigationController?.viewControllers
//                for vc in controllers! {
//                    if vc is ViewControllerIncio {
//                        self.navigationController?.popToViewController(vc as! ViewControllerIncio, animated: true)
//                    }
//                }
        navigationController?.popToRootViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
