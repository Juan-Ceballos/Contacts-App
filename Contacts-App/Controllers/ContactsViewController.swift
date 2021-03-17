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
        view.backgroundColor = .white
        navigationItem.title = "Contacts"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addContactButtonPressed))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        configureCollectionView()
        configureDataSource()
        fetchContacts()
        contactsView.contactsCollectionView.delegate = self
    }
    
    @objc private func addContactButtonPressed() {
        navigationController?.pushViewController(AddContactViewController(), animated: true)
    }
    
    private func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<SectionKind, Contact>(collectionView: contactsView.contactsCollectionView, cellProvider: { (collectionView, indexPath, contact) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCell.reuseIdentifier, for: indexPath) as? ContactCell else {
                fatalError()
            }
            
            cell.fullNameLabel.text = contact.fullName
            cell.numberLabel.text = contact.number.description
            cell.fullNameLabel.textColor = .white
            cell.numberLabel.textColor = .white
            return cell
        })
        
        var snapshot = datasource.snapshot()
        var sectionsArr = [SectionKind]()
        let contacts = Contact.createContactsArray()
        let sortedContacts = Contact.alphebeticalContacts(contacts: contacts)
        for num in 0...25 {
            if sortedContacts[num].count != 0 {
                sectionsArr.append(SectionKind(rawValue: num)!)
            }
        }
        
        datasource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as? HeaderView else {
                fatalError()
            }
            
            headerView.textLabel.text = sectionsArr[indexPath.section].sectionTitle
            headerView.textLabel.textAlignment = .left
            headerView.textLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            headerView.textLabel.textColor = .white
            
            return headerView
        }
        
        snapshot.appendSections(sectionsArr)
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    private func fetchContacts() {
        let contacts = Contact.createContactsArray()
        updateSnapshot(contacts: contacts)
    }
    
    private func updateSnapshot(contacts: [Contact]) {
        var snapshot = datasource.snapshot()
        snapshot.deleteAllItems()
        
        let sortedContacts = Contact.alphebeticalContacts(contacts: contacts)
        var sectionsArr = [SectionKind]()

        for num in 0...25 {
            if sortedContacts[num].count != 0 {
                sectionsArr.append(SectionKind(rawValue: num)!)
            }
        }
        snapshot.appendSections(sectionsArr)
        
        for num in 0...25 {
            if sortedContacts[num].count != 0 {
                snapshot.appendItems(sortedContacts[num], toSection: SectionKind(rawValue: num))
            }
        }
        
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureCollectionView() {
        contactsView.contactsCollectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.reuseIdentifier)
        contactsView.contactsCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseIdentifier)
    }
    
}

extension ContactsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailContactsVC = DetailContactsViewController()
        
        guard let contact = datasource.itemIdentifier(for: indexPath) else {
            fatalError()
        }
        
        self.navigationController?.pushViewController(detailContactsVC, animated: true)
    }
}
