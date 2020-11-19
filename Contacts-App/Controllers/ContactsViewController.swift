//
//  ViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 11/19/20.
//

import UIKit

class ContactsViewController: UIViewController {

    let contactsView = ContactsView()
    
    override func loadView() {
        view = contactsView
    }
    
    private enum Section {
        case main
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Contact>
    private var datasource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        configureDataSource()
        fetchContacts()
    }
    
    private func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<Section, Contact>(collectionView: contactsView.contactsCollectionView, cellProvider: { (collectionView, indexPath, contact) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCell.reuseIdentifier, for: indexPath) as? ContactCell else {
                fatalError()
            }
            
            cell.fullNameLabel.text = contact.fullName
            cell.numberLabel.text = contact.number.description
            cell.backgroundColor = .tertiarySystemGroupedBackground
            
            return cell
        })
        
        var snapshot = datasource.snapshot()
        snapshot.appendSections([.main])
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    private func fetchContacts() {
        let contacts = Contact.createContactsArray()
        updateSnapshot(contacts: contacts)
    }
    
    private func updateSnapshot(contacts: [Contact]) {
        var snapshot = datasource.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([.main])
        snapshot.appendItems(contacts)
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureCollectionView() {
        contactsView.contactsCollectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.reuseIdentifier)
    }
    
}

