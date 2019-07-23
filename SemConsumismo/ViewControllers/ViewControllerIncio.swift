//
//  ViewControllerIncio.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 18/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerIncio: UIViewController {
    
    var context:NSManagedObjectContext?
    var dinheiroTotal:Double? = 0.0
    var gastoDiario:Double? = 0.0
    
    var plantinhaEstado: String? {
        didSet {
            switch plantinhaEstado {
            case "estado 1":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha1")
            case "estado 2":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 2")
            case "estado 3":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 3")
            case "estado 4":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 4")
            case "estado 5":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 5")
            case "estado 6":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 6")
            case "estado 7":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 7")
            case "estado 8":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 7")
            case "estado 9":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 9")
            case "estado 10":
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha 10")
            default:
                plantinhaImagem.image = #imageLiteral(resourceName: "Plantinha1")
            }
        }
    }

    var valorDiario: ValorDiario?
    var plantinha: Plantinha?
    
    @IBAction func naoBotao(_ sender: Any) {
        
//        let valor = 100.0
//        dinheiro = dinheiro + valor
//        lblDinheiroNaoGasto.text = "\(dinheiro)"
//        dinheiroTotal += gastoDiario
        valorDiario?.valorTotal += gastoDiario ?? 0
        lblDinheiroNaoGasto.text = String(valorDiario?.valorTotal ?? 0)
        print(valorDiario?.valorTotal)
        print(gastoDiario)
        lblDinheiroNaoGasto.reloadInputViews()
        
    }
    @IBOutlet weak var lblDinheiroNaoGasto: UILabel!
    @IBOutlet weak var plantinhaImagem: UIImageView!
    //    var acesso:Bool = false
//
//    override func viewDidAppear(_ animated: Bool) {
//        if !acesso {
//            let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)
//            if let tutorial = storyboard.instantiateViewController(withIdentifier: "tutorial")
//                as? ViewControllerTutorial{
//                present(tutorial, animated: true, completion: nil)
//            }
//            acesso = true
//        }
//    }
    
//    func puxarDados(){
//        do {
//            guard let context = context else {return}
//            let result = try context.fetch(ValorDiario.fetchRequest())
//            print(result)
////            gastoDiario = gd.valorDinheiro
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        loadData()
        print(gastoDiario)
        print(dinheiroTotal)
        if(plantinhaEstado == nil){
            plantinhaEstado = "estado 1"
        }
        updateData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.view.reloadInputViews()
        loadData()
    }
    func updateData(){
        dinheiroTotal = valorDiario?.valorTotal
        print(plantinha)
        if plantinha?.estado != nil {
            plantinhaEstado = plantinha?.estado
        }else{
            plantinhaEstado = "estado 1"
        }
    }

    func loadData(){
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "ValorDiario")
        request.returnsObjectsAsFaults = false
        if let context = context{
            do{
                let result = try context.fetch(request)
                let data = result.last as? NSManagedObject
                valorDiario = data as? ValorDiario
                gastoDiario = valorDiario?.value(forKey: "valorDinheiro") as? Double
//                valorDiario = result.last as? ValorDiario
//                for data in result as! [NSManagedObject] {
////                    gastoDiario = data.value(forKey: "valorDinheiro") as! Double
////                    dinheiroTotal = data.value(forKey: "valorTotal") as! Double
//                    valorDiario = data as? ValorDiario
//                }
            }catch{
                fatalError("404 - ValorDiario: Entity not found!")
            }
        }
        
        request = NSFetchRequest<NSFetchRequestResult>(entityName: "Plantinha")
        request.returnsObjectsAsFaults = false
        if let context = context{
            do{
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                    //                    print(data.value(forKey: "valorDinheiro"))
//                    plantinhaEstado = data.value(forKey: "estado") as? String
                    plantinha = data as? Plantinha
                }
            }catch{
                fatalError("404 - Plantinha: Entity not found!")
            }
        }
        if plantinha == nil{
            plantinha = NSEntityDescription.insertNewObject(forEntityName: "Plantinha", into: context!) as? Plantinha
        }
        
        updateData()
    }
    
    func saveData(){
        
    }
}
