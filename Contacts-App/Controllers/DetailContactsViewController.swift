//
//  DetailContactsViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/15/21.
//

import UIKit

class DetailContactsViewController: UIViewController {

    let detailContactsView = DetailContactsView()
    
    override func loadView() {
        view = detailContactsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }

}
