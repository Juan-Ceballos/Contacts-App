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
    
    public func createContact(firstName: String, lastName: String, email: String, poNumber: String, street: String, apt: String, state: String, city: String, zipCode: String, isFavorite: Bool, isOriginal: Bool, refFav: UUID? = nil) -> Contact {
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
        contact.refOrig = UUID()
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
    
    public func deleteFavoriteContact(contact: Contact) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        fetchRequest.predicate = NSPredicate(format: "refFav == %@ && isOriginal == FALSE", "\(contact.refFav?.uuidString ?? "")")
        do {
            let result = try context.fetch(fetchRequest) as? [NSManagedObject]
            let favoriteContact = result![0]
            context.delete(favoriteContact)
        } catch {
            print("error deleting favorite contact")
        }
        
        do {
            try context.save()
        } catch {
            print("")
        }
    }
    
    public func favoriteContact(contact: Contact) {
        let contactObject = context.object(with: contact.objectID)
        
        contactObject.setValuesForKeys(["isFavorite": true, "refFav": UUID()])
        
        do {
            try context.save()
        } catch {
            print("failed to update isFavorite on original contact")
        }
    }
    
    public func unfavoriteContact(contact: Contact) {
        let contactObject = context.object(with: contact.objectID)
        contactObject.setValue(false, forKey: "isFavorite")
        
        do {
            try context.save()
        } catch {
            print("error unfavorite")
        }
    }
    
    public func createFavoriteContact(contact: Contact, isFavorite: Bool, isOriginal: Bool) -> Contact {
        
        let contactFavorite = Contact(entity: Contact.entity(), insertInto: context)
        contactFavorite.firstName = contact.firstName
        contactFavorite.lastName = contact.lastName
        contactFavorite.fullName = "\(contact.firstName ?? "") \(contact.lastName ?? "")"
        contactFavorite.email = contact.email
        contactFavorite.street = contact.street
        contactFavorite.poNumber = contact.poNumber
        contactFavorite.dateCreated = Date()
        contactFavorite.apt = contact.apt
        contactFavorite.city = contact.city
        contactFavorite.state = contact.state
        contactFavorite.zipCode = contact.zipCode
        contactFavorite.isFavorite = isFavorite
        contactFavorite.isOriginal = isOriginal
        contactFavorite.refFav = contact.refFav
        contactFavorite.refOrig = contact.refOrig
        
        do {
            try context.save()
        } catch {
            print("error saving to context, creating user: \(error)")
        }
        
        return contact
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
            
            if element.isFavorite == true && element.isOriginal == false {
                sectionsArr[0].append(element)
            } else {
                sectionsArr[currentIndex].append(element)
            }
        }
        return sectionsArr
    }
    
}


