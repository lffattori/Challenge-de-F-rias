//
//  PlantinhaCollectionViewController.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 24/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import UIKit

class GardenCollectionController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let number = UserDefaults.standard.integer(forKey: "numero_plantinhas")
        return number

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPlantinha", for: indexPath)
        
        return cell
    }

}
