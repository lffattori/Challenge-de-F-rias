//
//  ViewControllerInfo.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 17/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerInfo: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var campoReflexao: UITextView!
    @IBAction func salvar(_ sender: Any) {
        guard let context = context else {
            return
        }
        let registro = NSEntityDescription.insertNewObject(forEntityName: "Reflexoes", into: context) as! Reflexoes
        registro.reflexao = campoReflexao.text
        if let d = Float(campoValor.text!) {
            registro.valor = d
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
    }
    @IBOutlet weak var campoValor: UITextField!
    var context:NSManagedObjectContext?
    
    override func viewDidLoad() {
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        campoReflexao.delegate = self
        campoReflexao.text = "Insira aqui sua reflexão"
        campoReflexao.textColor = .lightGray
        
        // Do any additional setup after loading the view.
    }
    @IBAction func botaoCancelar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if campoReflexao.textColor == UIColor.lightGray {
            campoReflexao.text = nil
            campoReflexao.textColor = #colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if campoReflexao.text.isEmpty {
            campoReflexao.text = "Insira aqui a sua reflexão"
            campoReflexao.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
}
