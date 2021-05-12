//
//  ViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 11/19/20.
//

import UIKit
import CoreData

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
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextObjectsDidChange, object: context)
        NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextDidSave, object: context)
        view.backgroundColor = .systemBackground
        navigationItem.title = NSLocalizedString("Contacts", comment: "Title of the Navigation Bar")
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addContactButtonPressed))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        configureCollectionView()
        configureDataSource()
        fetchContacts()
        contactsView.contactsCollectionView.delegate = self
    }
    
    @objc private func managedObjectContextObjectsDidChange(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        if let inserts = userInfo[NSInsertedObjectsKey] as? Set<NSManagedObject>, inserts.count > 0 {
            configureDataSource()
            fetchContacts()
        }
        
        if let edit = userInfo[NSUpdatedObjectsKey] as? Set<NSManagedObject>, edit.count > 0 {
            print("an edit was made to a contact")
            configureDataSource()
            fetchContacts()
        }
    }
    
    @objc private func addContactButtonPressed() {
        navigationController?.pushViewController(AddContactViewController(contactState: .newContact), animated: true)
    }
    
    private func configureDataSource() {
        datasource = UICollectionViewDiffableDataSource<SectionKind, Contact>(collectionView: contactsView.contactsCollectionView, cellProvider: { (collectionView, indexPath, contact) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCell.reuseIdentifier, for: indexPath) as? ContactCell else {
                fatalError()
            }
            
            cell.fullNameLabel.text = contact.fullName
            cell.numberLabel.text = contact.poNumber?.description
            cell.initialsLabel.text = String(contact.firstName?.first?.uppercased() ?? " ") + String(contact.lastName?.first?.uppercased() ?? " ")
            return cell
        })
        
        var snapshot = datasource.snapshot()
        var sectionsArr = [SectionKind]()
        let sortedContacts = CoreDataManager.shared.sectionContacts()
        
        for num in 0...26 {
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
            headerView.textLabel.textColor = UIColor(named: "MyTextColor")
            
            return headerView
        }
        
        snapshot.appendSections(sectionsArr)
        datasource.apply(snapshot, animatingDifferences: false)
    }
    
    private func fetchContacts() {
        updateSnapshot()
    }
    
    private func updateSnapshot() {
        var snapshot = datasource.snapshot()
        snapshot.deleteAllItems()
        
        let sortedContacts = CoreDataManager.shared.sectionContacts()
        var sectionsArr = [SectionKind]()
                
        for num in 0...26 {
            if sortedContacts[num].count != 0 {
                sectionsArr.append(SectionKind(rawValue: num)!)
            }
        }
        snapshot.appendSections(sectionsArr)
        
        for num in 0...26 {
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
        
        guard let contact = datasource.itemIdentifier(for: indexPath) else {
            fatalError()
        }
        
        let detailContactsVC = DetailContactsViewController(contact: contact)
        
        self.navigationController?.pushViewController(detailContactsVC, animated: true)
    }
}
