//
//  Reflexoes+CoreDataProperties.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 22/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//
//

import Foundation
import CoreData


extension Reflexoes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reflexoes> {
        return NSFetchRequest<Reflexoes>(entityName: "Reflexoes")
    }

    @NSManaged public var reflexao: String?
    @NSManaged public var valor: Double

}
