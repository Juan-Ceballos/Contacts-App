# Contacts-App

## Overview

Contacts-App allows users to create, browse, favorite and edit contacts.


## Features


### Create Contacts

![CreateContact](Contacts-App/SupportingFiles/Assets.xcassets/CreateContact.imageset/CreateContact.png)

### Contact Details, Edit/Favorite

![DetailContact](Contacts-App/SupportingFiles/Assets.xcassets/DetailContact.imageset/DetailContact.png)

### Browse Contacts

Normal Mode            | Not Afraid of the Dark...Mode
---------------------- | -----------------------
![Contacts](Contacts-App/SupportingFiles/Assets.xcassets/Contacts.imageset/Contacts.png) | ![ContactsDark](Contacts-App/SupportingFiles/Assets.xcassets/ContactsDark.imageset/ContactsDark.png)

## Code Block

### Create Contact Add to Core Data

```swift
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
```

## Installation

### Clone

* Clone this repo to your local machine using `https://github.com/Juan-Ceballos/Contacts-App.git`

## Built With

* XCode

* Swift

* MapKit

* Core Data

* Diffable DataSource / Compositional Collection View 

## Collaborators

[Juan Ceballos](https://github.com/Juan-Ceballos)

[![Juan](https://avatars1.githubusercontent.com/u/55723135?s=250&u=cce4396e360011123eebd2f52323aa6248023ef0&v=4)](https://github.com/Juan-Ceballos)

