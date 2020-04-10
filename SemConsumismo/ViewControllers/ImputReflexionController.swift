//
//  ViewControllerInfo.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 17/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class ImputReflexionController: UIViewController, UITextViewDelegate {
    var fieldIsEmpity = true
    var context:NSManagedObjectContext?

    @IBOutlet weak var reflexionTextField: UITextView!
    @IBOutlet weak var costTextField: UITextField!

    @IBAction func save(_ sender: Any) {
        guard let context = context else {
            return
        }
        let registro = NSEntityDescription.insertNewObject(forEntityName: "Reflexoes", into: context) as! Reflexoes
        registro.reflexao = reflexionTextField.text
        if let d = Float(costTextField.text!.replacingOccurrences(of: ",", with: ".")) {
            registro.valor = d
        }
        if fieldIsEmpity {
            let alert = UIAlertController(title:"Atenção", message: "O campo para fazer as suas reflexões está vazio, faça a sua reflexão para salvar.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
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
}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        reflexionTextField.delegate = self
        reflexionTextField.text = "Insira aqui sua reflexão"
        reflexionTextField.textColor = .lightGray
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if reflexionTextField.textColor == UIColor.lightGray {
            reflexionTextField.text = nil
            reflexionTextField.textColor = #colorLiteral(red: 0.4391747117, green: 0.4392418861, blue: 0.4391601086, alpha: 1)
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if reflexionTextField.text.isEmpty {
            reflexionTextField.text = "Insira aqui a sua reflexão"
            reflexionTextField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            fieldIsEmpity = true
        } else {
            fieldIsEmpity = false
        }
    }
}
