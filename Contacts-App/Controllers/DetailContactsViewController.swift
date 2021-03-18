//
//  DetailContactsViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/15/21.
//

import UIKit

class DetailContactsViewController: UIViewController {
    
    var fullName: String
    var phoneNumber: Int
    
    init(fullName: String, phoneNumber: Int) {
        self.fullName = fullName
        self.phoneNumber = phoneNumber
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
    }
    
    private func setupUI() {
        detailContactsView.fullNameTextLabel.text = fullName
        detailContactsView.phoneNumberTextLabel.text = String(phoneNumber)
        detailContactsView.fullNameTextLabel.textColor = .systemBackground
        detailContactsView.phoneNumberTextLabel.textColor = .systemBackground
        detailContactsView.fullNameTextLabel.font = .systemFont(ofSize: 22)
        detailContactsView.phoneNumberTextLabel.font = .systemFont(ofSize: 22)
        detailContactsView.fullNameTextLabel.textAlignment = .center
        detailContactsView.phoneNumberTextLabel.textAlignment = .center
        
    }

}
