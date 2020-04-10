//
//  EsquerdaParaDireita.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 18/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class LeftToRightSegue: UIStoryboardSegue {

    override func perform(){
        let source = self.source
        let destination = self.destination
        
        source.view.superview?.insertSubview(destination.view, aboveSubview: source.view)
        destination.view.transform = CGAffineTransform(translationX: -source.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        destination.view.transform = CGAffineTransform(translationX: 0, y: 0)
        },
                       completion: { finished in
                        source.present(destination, animated: false, completion: nil)
        }
        )
    }
}
