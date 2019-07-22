//
//  ViewControllerTutorial.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 19/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class ViewControllerTutorial: UIViewController {
    var pageViewController: PageViewController?
    
    @IBOutlet weak var botaoProx: UIButton!
    @IBOutlet weak var botaoVoltar: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func actionVoltar(_ sender: Any) {
        if let index = pageViewController?.indiceAtual{
            switch index {
            case 1:
                pageViewController?.voltarPagina()
            default:
                break
            }
        }
        self.atualizarInterface()
        
    }
    
    @IBAction func actionProx(_ sender: Any) {
        if let index = pageViewController?.indiceAtual{
            switch index {
            case 0:
                pageViewController?.avancarPagina()
                print ("Clicou")
            case 1:
                dismiss(animated: true, completion: nil)
                print ("Sumiu")
            default:
                break
            }
        }
        self.atualizarInterface()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        botaoVoltar.isHidden = true

        // Do any additional setup after loading the view.
    }
    func atualizarInterface(){
        if let index = pageViewController?.indiceAtual{
            switch index {
            case 0:
                botaoVoltar.isHidden = true
            case 1:
                botaoVoltar.isHidden = false
            default:
                break
            }
        pageControl.currentPage = index
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageView = destination as? PageViewController{
            pageViewController = pageView
            pageView.tutorialViewController = self
        }
    }

}
