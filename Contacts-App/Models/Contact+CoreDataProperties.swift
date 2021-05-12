//
//  Contact+CoreDataProperties.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 5/11/21.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var apt: String?
    @NSManaged public var city: String?
    @NSManaged public var contactId: UUID?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var fullName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var poNumber: String?
    @NSManaged public var state: String?
    @NSManaged public var street: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var img: Data?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var favId: UUID?

}

extension Contact : Identifiable {

}
