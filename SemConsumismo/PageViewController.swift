//
//  PageViewController.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 19/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var todasAsViewsControllers:[UIViewController] = {
        return [
        novaViewController(viewController: "bem-vindo"),
        novaViewController(viewController: "gastoDiario")]
        
    }()
    var indiceAtual = 0
    var tutorialViewController:ViewControllerTutorial?
    
    func novaViewController(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Tutorial", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = todasAsViewsControllers.firstIndex(of: viewController)
            else {
                return nil
        }
        let indiceAnterior = index - 1
        return conteudoViewController(at: indiceAnterior)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = todasAsViewsControllers.firstIndex(of: viewController)
            else {
                return nil
        }
        let indicePosterior = index + 1
        return conteudoViewController(at: indicePosterior)
    }
    
    func conteudoViewController(at index: Int) -> UIViewController? {
        if index < 0 || index >= todasAsViewsControllers.count {
            return nil
        }
        else {
            return todasAsViewsControllers[index]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let primeiraViewController = todasAsViewsControllers.first{
            setViewControllers([primeiraViewController], direction: .forward, animated: true, completion: nil)

        }
        self.delegate = self
    

        // Do any additional setup after loading the view.
    }
    
    func avancarPagina (){
        indiceAtual += 1
        if let proxima = conteudoViewController(at: indiceAtual) {
            setViewControllers([proxima], direction: .forward, animated: true, completion: nil)
        }
    }
    func voltarPagina(){
        indiceAtual -= 1
        if let proxima = conteudoViewController(at: indiceAtual) {
            setViewControllers([proxima], direction: .reverse, animated: true, completion: nil)
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let VC = pageViewController.viewControllers{
            let paginaAtual = VC[0]
            if let indice = todasAsViewsControllers.firstIndex(of: paginaAtual){
                self.indiceAtual = indice
            }
        }
        if let TVC = tutorialViewController{
            TVC.atualizarInterface()
        }
    }
}
