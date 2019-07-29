//
//  ConfiguracoesViewController.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 22/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class ConfiguracoesViewController: UIViewController {
    
    var context:NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.hideKeyboardWhenTappedAround() 
    }
    
    @IBAction func salvarInfo(_ sender: Any) {
        guard let context = context else {
            return
        }
        if let text = campoValor.text, text != "" {
            let registro = NSEntityDescription.insertNewObject(forEntityName: "ValorDiario", into: context) as! ValorDiario
            print(registro)
            if let v = Float(text){
                registro.valorDinheiro = v
            }
            
            navigationController?.popViewController(animated: true)
            print ("clicked")
            do {
                try context.save()
                print("salvo")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
            self.dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Digite um valor para podermos fazer as estimativas para você", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (oktapped) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @IBOutlet weak var campoValor: UITextField!
    
    
    @IBAction func botaoCancelar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 
}

