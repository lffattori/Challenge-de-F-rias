//
//  ViewControllerInfo.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 17/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerInfo: UIViewController {
    @IBOutlet weak var campoReflexao: UITextField!
    @IBAction func salvar(_ sender: Any) {
        guard let context = context else {
            return
        }
        let registro = NSEntityDescription.insertNewObject(forEntityName: "Reflexoes", into: context) as! Reflexoes
        registro.reflexao = campoReflexao.text
        registro.valor = campoValor.text
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
