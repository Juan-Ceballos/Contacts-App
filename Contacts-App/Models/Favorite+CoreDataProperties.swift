//
//  Favorite+CoreDataProperties.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 5/12/21.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }


}
