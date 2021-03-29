//
//  DetailContactsViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/15/21.
//

import UIKit

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
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        detailContactsView.fullNameTextLabel.text = contact.fullName
        detailContactsView.phoneNumberTextLabel.text = contact.poNumber
        detailContactsView.emailButton.setTitle(contact.email, for: .normal)
    }
    
    @objc private func editButtonPressed() {
        print("Button Pressed")
    }

}
