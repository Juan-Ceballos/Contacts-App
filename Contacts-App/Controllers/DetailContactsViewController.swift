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
    
    private var selectedImage: UIImage? {
        didSet {
            detailContactsView.profilePicture.image = selectedImage
        }
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
        detailContactsView.mapButton.addTarget(self, action: #selector(mapButtonPressed), for: .touchUpInside)
        view.backgroundColor = .systemBackground
    }
    
    @objc private func mapButtonPressed() {
        let mapViewController = MapViewController(contactLocation: "\(contact.street ?? "") \(contact.apt ?? "") \(contact.city ?? "") \(contact.state ?? "") \(contact.zipCode ?? "")", contactFirstName: contact.firstName ?? "")
        navigationController?.pushViewController(mapViewController, animated: true)
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
        detailContactsView.aptLabel.text = contact.apt
        detailContactsView.cityLabel.text = contact.city
        detailContactsView.stateLabel.text = contact.state
        detailContactsView.streetAddressLabel.text = contact.street
        detailContactsView.zipCodeLabel.text = contact.zipCode
    }
    
    @objc private func editButtonPressed() {
        print("Button Pressed")
        let addContactVC = AddContactViewController(contactState: .editContact, contact: contact)
        self.navigationController?.pushViewController(addContactVC, animated: true)
    }

}

extension DetailContactsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        selectedImage = image
        dismiss(animated: true)
    }
}
