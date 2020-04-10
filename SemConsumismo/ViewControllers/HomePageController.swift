//
//  ViewControllerIncio.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 18/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class HomePageController: UIViewController {
    
    var context:NSManagedObjectContext?
    var totalSaved:Float? = 0.0
    var dailyExpenses:Float? = 0.0
    var plantState: Int32? {
        didSet {
            switch plantState {
            case 1:
                plantImage.image = #imageLiteral(resourceName: "Plantinha1")
            case 2:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 2")
            case 3:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 3")
            case 4:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 4")
            case 5:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 5")
            case 6:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 6 - 1")
            case 7:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 7 - 1")
            case 8:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 8 - 1")
            case 9:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 9 - 1")
            case 10:
                plantImage.image = #imageLiteral(resourceName: "Plantinha 10")

                let numeroPlantinhas = UserDefaults.standard.integer(forKey: "numero_plantinhas")
                UserDefaults.standard.set(numeroPlantinhas + 1, forKey: "numero_plantinhas")
                print(UserDefaults.standard.integer(forKey: "numero_plantinhas"))
            default:
                plantImage.image = #imageLiteral(resourceName: "Plantinha1")
                plantState = Int32(1)
            }
        }
    }
    var dailyExpense: ValorDiario?
    var plantinha: Plantinha?

    @IBOutlet weak var lblSavedMoney: UILabel!
    @IBOutlet weak var plantImage: UIImageView!
    @IBAction func noButton(_ sender: Any) {
           let aux = Int(plantState!)
           if dailyExpense == nil {
               let alert = UIAlertController (title: "Atenção", message: "Você ainda não tem nenhum valor salvo. Vá nas configurações ⚙️ e coloque o quanto você gasta por dia ", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(oktapped) in self.dismiss(animated: true, completion: nil)}))
               self.present(alert, animated: true, completion: nil)
           } else {
           plantState = Int32(aux + 1)
           dailyExpense?.valorTotal += dailyExpenses ?? 0
           self.totalSaved = dailyExpense?.valorTotal ?? 0
           lblSavedMoney.text = String(format: "%.2f", dailyExpense?.valorTotal ?? 0).replacingOccurrences(of: ".", with: ",")
           lblSavedMoney.reloadInputViews()
           self.saveData()
           }

       }

    override func viewDidLoad() {
        super.viewDidLoad()
        createANotification()
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        loadData()
        lblSavedMoney.text = String(format: "%.2f", dailyExpense?.valorTotal ?? 0).replacingOccurrences(of: ".", with: ",")
        lblSavedMoney.reloadInputViews()
        if(plantState == nil){
            plantState = Int32(1)
        } else {
            plantState = plantinha?.estado
        }
        updateData()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.view.reloadInputViews()
        loadData()
    }

    func updateData(){
        totalSaved = dailyExpense?.valorTotal
        if plantinha?.estado != nil {
            plantState = plantinha?.estado
        } else {
            plantState = Int32(1)
        }
    }

    func loadData(){
        var request = NSFetchRequest<NSFetchRequestResult>(entityName: "ValorDiario")

        request.returnsObjectsAsFaults = false

        if let context = context{
            do {
                let result = try context.fetch(request)
                let data = result.last as? NSManagedObject
                dailyExpense = data as? ValorDiario
                dailyExpenses = dailyExpense?.value(forKey: "valorDinheiro") as? Float
                totalSaved = dailyExpense?.value(forKey: "valorTotal") as? Float
            } catch {
                fatalError("404 - ValorDiario: Entity not found!")
            }
        }
        
        request = NSFetchRequest<NSFetchRequestResult>(entityName: "Plantinha")
        request.returnsObjectsAsFaults = false
        if let context = context{
            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                    plantinha = data as? Plantinha
                }
            } catch {
                fatalError("404 - Plantinha: Entity not found!")
            }
        }
        updateData()
    }
    
    func saveData(){
        guard let context = context else {
            return
        }
            let registro = NSEntityDescription.insertNewObject(forEntityName: "ValorDiario", into: context) as! ValorDiario
            print(registro)
            registro.valorTotal = totalSaved ?? 0
        registro.valorDinheiro = dailyExpenses ?? 0
            print ("clicked")
            do {
                try context.save()
                print("salvo")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        
        let registroPlanta = NSEntityDescription.insertNewObject(forEntityName: "Plantinha", into: context) as! Plantinha
        print(registroPlanta)
        registroPlanta.estado = self.plantState ?? 1
        print ("clicked")
        do {
            try context.save()
            print("salvo")
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

