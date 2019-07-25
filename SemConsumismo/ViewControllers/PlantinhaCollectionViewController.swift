//
//  PlantinhaCollectionViewController.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 24/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class PlantinhaCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "celulaPlantinha")

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let number = UserDefaults.standard.integer(forKey: "numero_plantinhas")
        return number

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPlantinha", for: indexPath)
//        let numberOfCells = UserDefaults.standard.integer(forKey: "numero_plantinha")
//        let numeroDePlantinhas:Int = UserDefaults.standard.integer(forKey: "numero_plantinha")
        
        return cell
    }

}
