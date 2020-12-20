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
    
    private typealias DataSource = UICollectionViewDiffableDataSource<SectionKind, Contact>
    private var datasource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Contacts"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        configureCollectionView()
        configureDataSource()
        fetchContacts()
    }
    
    private func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<SectionKind, Contact>(collectionView: contactsView.contactsCollectionView, cellProvider: { (collectionView, indexPath, contact) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCell.reuseIdentifier, for: indexPath) as? ContactCell else {
                fatalError()
            }
            
            cell.fullNameLabel.text = contact.fullName
            cell.numberLabel.text = contact.number.description
            //cell.backgroundColor = .tertiarySystemGroupedBackground
            
            cell.backgroundColor = .red
            return cell
        })
        
        datasource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as? HeaderView, let sectionKind = SectionKind(rawValue: indexPath.section) else {
                fatalError()
            }
            
            headerView.textLabel.text = sectionKind.sectionTitle
            headerView.textLabel.textAlignment = .left
            headerView.textLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            
            return headerView
        }
        
        var snapshot = datasource.snapshot()
        snapshot.appendSections([.a, .b, .c, .d, .e, .f, .g, .h, .i, .j, .k, .l, .m, .n, .o, .p, .q, .r, .s, .t, .u, .v, .w, .x, .y, .z])
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    private func fetchContacts() {
        let contacts = Contact.createContactsArray()
        updateSnapshot(contacts: contacts)
    }
    
    private func updateSnapshot(contacts: [Contact]) {
        var snapshot = datasource.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([.a, .b, .c, .d, .e, .f, .g, .h, .i, .j, .k, .l, .m, .n, .o, .p, .q, .r, .s, .t, .u, .v, .w, .x, .y, .z])
//        for contact in contacts {
//            if contact.lastName == "" {
//                print()
//            }
//        }
        //snapshot.appendItems(contacts)
        let sortedContacts = Contact.alphebeticalContacts(contacts: contacts)
        
        snapshot.appendItems(sortedContacts[0], toSection: .a)
        snapshot.appendItems(sortedContacts[1], toSection: .b)
        snapshot.appendItems(sortedContacts[2], toSection: .c)
        snapshot.appendItems(sortedContacts[3], toSection: .d)
        snapshot.appendItems(sortedContacts[4], toSection: .e)
        snapshot.appendItems(sortedContacts[5], toSection: .f)
        snapshot.appendItems(sortedContacts[6], toSection: .g)
        snapshot.appendItems(sortedContacts[7], toSection: .h)
        snapshot.appendItems(sortedContacts[8], toSection: .i)
        snapshot.appendItems(sortedContacts[9], toSection: .j)
        snapshot.appendItems(sortedContacts[10], toSection: .k)
        snapshot.appendItems(sortedContacts[11], toSection: .l)
        snapshot.appendItems(sortedContacts[12], toSection: .m)
        snapshot.appendItems(sortedContacts[13], toSection: .n)
        snapshot.appendItems(sortedContacts[14], toSection: .o)
        snapshot.appendItems(sortedContacts[15], toSection: .p)
        snapshot.appendItems(sortedContacts[16], toSection: .q)
        snapshot.appendItems(sortedContacts[17], toSection: .r)
        snapshot.appendItems(sortedContacts[18], toSection: .s)
        snapshot.appendItems(sortedContacts[19], toSection: .t)
        snapshot.appendItems(sortedContacts[20], toSection: .u)
        snapshot.appendItems(sortedContacts[21], toSection: .v)
        snapshot.appendItems(sortedContacts[22], toSection: .w)
        snapshot.appendItems(sortedContacts[23], toSection: .x)
        snapshot.appendItems(sortedContacts[24], toSection: .y)
        //snapshot.appendItems(sortedContacts[25], toSection: .z)
        
        
        
        //snapshot.appendItems(contacts, toSection: .a)
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureCollectionView() {
        contactsView.contactsCollectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.reuseIdentifier)
        contactsView.contactsCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseIdentifier)
    }
    
}

