//
//  Contacts.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 11/19/20.
//

import Foundation

struct Contact: Hashable {
    
    let firstName: String
    let lastName: String
    let number: Int
    var fullName: String {
        return "\(firstName), \(lastName)"
    }
    // computed property for first and last name
    
    init(fName: String, lName: String, number: Int) {
        self.firstName = fName
        self.lastName = lName
        self.number = number
    }
    
}

extension Contact {
    static func createContactsArray() -> [Contact] {
        
        let contactsDict = [03364152046: ("Christin", "Böttger"),
                            927525456: ("Joaquin", "Bravo"),
                            6868840334: ("David", "Edwards"),
                            07905753: ("Roope", "Mattila"),
                            27991860: ("Lærke", "Wist"),
                            957021797: ("Jonathan", "Diez"),
                            01768757320: ("Emily", "Long"),
                            0501439641: ("Noe", "Roussel"),
                            375351453: ("Justin", "Harris"),
                            3028950023: ("Ezra", "Lee"),
                            0478121870: ("Ninon", "Bernard"),
                            60749217: ("Helene", "Strange"),
                            7638623154: ("Estefânia", "Barros"),
                            2945132492: ("Gül", "Sinanoğlu"),
                            1963139555: ("George", "Miller"),
                            64513463: ("Cecilie", "Peterson"),
                            01539627648: ("Jared", "Mitchelle"),
                            0157693915: ("Valdelaine", "de Souza"),
                            07798852536: ("Kristin", "Tausch"),
                            00499228235: ("Marissa", "Rode"),
        ]
        
        var contacts = [Contact]()
    
        for (number, (first, last)) in contactsDict {
            let newContact = Contact(fName: first, lName: last, number: number)
            contacts.append(newContact)
        }
        return contacts
    }
}

// Array of Contacts object
// list of contacts in a tableview
// built in subtitle cell
/*
 Show the contact's first and last name on the cell's text label. Create a computed property in your Contact struct to return fullname.
 Show the contact's phone number in the detail text label
 Extra:

 Add a unit test to verify you have 20 contacts.
 */
