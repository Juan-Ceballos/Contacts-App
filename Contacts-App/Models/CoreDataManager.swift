//
//  CoreDataManager.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/20/21.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    private var contacts = [Contact]()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // CRUD
    
    public func createContact(firstName: String, lastName: String, email: String, poNumber: String, address: String) -> Contact {
        let contact = Contact(entity: Contact.entity(), insertInto: context)
        contact.firtName = firstName
        contact.lastName = lastName
        contact.fullName = "\(firstName) \(lastName)"
        contact.email = email
        contact.address = address
        contact.poNumber = poNumber
        
        do {
            try context.save()
        } catch {
            print("error saving to context, creating user: \(error)")
        }
        
        return contact
    }
    
    public func fetchContact() -> [Contact] {
        do {
            contacts = try context.fetch(Contact.fetchRequest())
        } catch {
            print("fetching contacts from context")
        }
        
        return contacts
    }
}
