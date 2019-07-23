//
//  Plantinha+CoreDataProperties.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 22/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//
//

import Foundation
import CoreData


extension Plantinha {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plantinha> {
        return NSFetchRequest<Plantinha>(entityName: "Plantinha")
    }

    @NSManaged public var estado: String?

}
