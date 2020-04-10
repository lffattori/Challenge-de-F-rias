//
//  ViewController.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 19/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class PageController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private var pageControl:UIPageControl{
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 2
        
        return pc
    }
    
}
