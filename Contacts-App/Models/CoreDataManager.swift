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
    
    private var sortedContacts = [Contact]()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // CRUD
    
    public func createContact(firstName: String, lastName: String, email: String, poNumber: String, street: String, apt: String, state: String, city: String, zipCode: String, isFavorite: Bool, isOriginal: Bool, refFav: UUID? = nil, refOrig: UUID? = nil) -> Contact {
        let contact = Contact(entity: Contact.entity(), insertInto: context)
        contact.firstName = firstName
        contact.lastName = lastName
        contact.fullName = "\(firstName) \(lastName)"
        contact.email = email
        contact.street = street
        contact.poNumber = poNumber
        contact.dateCreated = Date()
        contact.apt = apt
        contact.city = city
        contact.state = state
        contact.zipCode = zipCode
        contact.isFavorite = isFavorite
        contact.isOriginal = isOriginal
        contact.refFav = refFav
        contact.refOrig = refOrig
        do {
            try context.save()
        } catch {
            print("error saving to context, creating user: \(error)")
        }
        
        return contact
    }
    
    public func updateContact(contact: Contact, firstName: String, lastName: String, poNumber: String, street: String, apt: String, city: String, state: String, zipCode: String, email: String) {
        let contactObject = context.object(with: contact.objectID)
        
        contactObject.setValuesForKeys(["firstName": firstName, "lastName": lastName, "poNumber": poNumber, "street": street, "apt": apt, "city": city, "state": state, "zipCode": zipCode, "dateCreated": Date(), "email": email, "fullName": "\(firstName) \(lastName)"])
        
        do {
            try context.save()
        } catch  {
            print("failed save update")
        }
    }
    
    public func fetchContact() -> [Contact] {
        let fetchRequest = NSFetchRequest<Contact>(entityName: "Contact")
        let sort = NSSortDescriptor(key: #keyPath(Contact.firstName), ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            sortedContacts = try context.fetch(fetchRequest)
            
        } catch {
            print("fetching contacts from context error")
        }
        
        return sortedContacts
    }
    
    
    
    public func sectionContacts() -> [[Contact]] {
        let sortedContacts = fetchContact()
        
        let sectionTitles: [String] = ["Favorite", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        var sectionsArr = Array(repeating: [Contact](), count: sectionTitles.count)
        
        var currentIndex = 1
        var currentAlphabetSection = sectionTitles[currentIndex]
        
        for element in sortedContacts {
            while element.firstName?.first?.lowercased() != Character(currentAlphabetSection).lowercased() && currentIndex < 26 {
                currentIndex += 1
                currentAlphabetSection = sectionTitles[currentIndex]
            }
            sectionsArr[currentIndex].append(element)
        }
        return sectionsArr
    }
    
}


