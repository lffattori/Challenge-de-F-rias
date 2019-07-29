//
//  ValorDiario+CoreDataProperties.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 26/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//
//

import Foundation
import CoreData


extension ValorDiario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ValorDiario> {
        return NSFetchRequest<ValorDiario>(entityName: "ValorDiario")
    }

    @NSManaged public var valorDinheiro: Float
    @NSManaged public var valorTotal: Float

}
