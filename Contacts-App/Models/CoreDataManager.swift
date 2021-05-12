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
    private var favorites = [Contact]()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // CRUD
    
    public func createContact(firstName: String, lastName: String, email: String, poNumber: String, street: String, apt: String, state: String, city: String, zipCode: String, isFavorite: Bool) -> Contact {
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
        do {
            try context.save()
        } catch {
            print("error saving to context, creating user: \(error)")
        }
        
        return contact
    }
    
    public func createFavorite() -> Favorite {
        let favorite = Favorite(entity: Favorite.entity(), insertInto: context)
        favorite.dateCreated = Date()
        
        do {
            try context.save()
        } catch {
            print("error saving favorite to context: \(error)")
        }
        
        return favorite
    }
    
    public func updateContact(firstName: String, lastName: String, poNumber: String, street: String, apt: String, city: String, state: String, zipCode: String, email: String) {
        var objArray: [NSManagedObject]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        fetchRequest.predicate = NSPredicate(format: "NOT (self IN %@)", argumentArray: objArray)
        
        do {
            objArray = try context.fetch(fetchRequest) as? [NSManagedObject]
            let foundContact = objArray![0]
        
            foundContact.setValuesForKeys(["firstName": firstName, "lastName": lastName, "poNumber": poNumber, "street": street, "apt": apt, "city": city, "state": state, "zipCode": zipCode, "dateCreated": Date(), "email": email, "fullName": "\(firstName) \(lastName)"])
        } catch  {
            print("failed contact core data search")
        }
        
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
            print("fetching contacts from context")
        }
        
        return sortedContacts
    }
    
    public func sectionContacts() -> [[Contact]] {
        let sortedContacts = fetchContact()
        
        let sectionTitles: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        var sectionsArr = Array(repeating: [Contact](), count: sectionTitles.count)
        
        var currentIndex = 0
        var currentAlphabetSection = sectionTitles[currentIndex]
        
        for element in sortedContacts {
            while element.firstName?.first?.lowercased() != Character(currentAlphabetSection).lowercased() && currentIndex < 25 {
                currentIndex += 1
                currentAlphabetSection = sectionTitles[currentIndex]
            }
                sectionsArr[currentIndex].append(element)
        }
        return sectionsArr
    }
    
    // sectionFavorite
    
}


