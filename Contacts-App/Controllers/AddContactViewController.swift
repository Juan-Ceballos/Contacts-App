//
//  AddContactViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 2/26/21.
//

import UIKit

class AddContactViewController: UIViewController {
    
    let addContactView = AddContactView()
    
    override func loadView() {
        view = addContactView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    
}
