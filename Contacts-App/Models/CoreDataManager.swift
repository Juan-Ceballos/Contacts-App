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
        
        let fetchRequest = NSFetchRequest<Contact>(entityName: "Contact")
        let sort = NSSortDescriptor(key: #keyPath(Contact.firtName), ascending: true)
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
            while element.firtName?.first?.lowercased() != Character(currentAlphabetSection).lowercased() && currentIndex < 25 {
                currentIndex += 1
                currentAlphabetSection = sectionTitles[currentIndex]
            }
            sectionsArr[currentIndex].append(element)
        }
        return sectionsArr
        
    }
}


