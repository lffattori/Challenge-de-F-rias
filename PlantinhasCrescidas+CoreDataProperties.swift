//
//  PlantinhasCrescidas+CoreDataProperties.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 22/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//
//

import Foundation
import CoreData


extension PlantinhasCrescidas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlantinhasCrescidas> {
        return NSFetchRequest<PlantinhasCrescidas>(entityName: "PlantinhasCrescidas")
    }

    @NSManaged public var quantidade: Int32

}
