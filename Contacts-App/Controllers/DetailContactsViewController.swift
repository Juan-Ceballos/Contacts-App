//
//  DetailContactsViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/15/21.
//

import UIKit
import CoreData

class DetailContactsViewController: UIViewController {
    
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    let detailContactsView = DetailContactsView()
    
    override func loadView() {
        view = detailContactsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        detailContactsView.editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextObjectsDidChange, object: context)
        NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextDidSave, object: context)
    }
    
    @objc private func managedObjectContextObjectsDidChange(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        if let edit = userInfo[NSUpdatedObjectsKey] as? Set<NSManagedObject>, edit.count > 0 {
            print("an edit was made to a contact")
            setupUI()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        detailContactsView.fullNameTextLabel.text = contact.fullName
        detailContactsView.phoneNumberTextLabel.text = contact.poNumber
        detailContactsView.emailButton.setTitle(contact.email, for: .normal)
        detailContactsView.aptLabel.text = "A1"
        detailContactsView.cityLabel.text = "Bronx"
        detailContactsView.stateLabel.text = "NY"
        detailContactsView.streetAddressLabel.text = contact.address
        detailContactsView.zipCodeLabel.text = "123456"
    }
    
    @objc private func editButtonPressed() {
        print("Button Pressed")
        let addContactVC = AddContactViewController(contactState: .editContact, contact: contact)
        self.navigationController?.pushViewController(addContactVC, animated: true)
    }

}
