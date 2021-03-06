//
//  Contacts_AppTests.swift
//  Contacts-AppTests
//
//  Created by Juan Ceballos on 11/19/20.
//

import XCTest
@testable import Contacts_App

class Contacts_AppTests: XCTestCase {

    func testCreateContactsArray() {
        let expContactsCount = 20
        
        let contacts = ContactHC.createContactsArray()
        
        XCTAssertEqual(expContactsCount, contacts.count)
    }
}

// zip code formatter
// po number
// valid email
