//
//  Contact+CoreDataProperties.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/30/21.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var fullName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var poNumber: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var contactId: UUID?

}

extension Contact : Identifiable {

}
