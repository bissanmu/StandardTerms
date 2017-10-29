//
//  Voca+CoreDataProperties.swift
//  StandardTerm
//
//  Created by admin on 2017. 10. 29..
//  Copyright © 2017년 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension Voca {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Voca> {
        return NSFetchRequest<Voca>(entityName: "Voca")
    }

    @NSManaged public var obj_knm: String?
    @NSManaged public var obj_enm: String?
    @NSManaged public var eng_full_nm: String?

}
