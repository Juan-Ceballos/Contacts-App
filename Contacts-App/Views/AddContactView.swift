//
//  AddContactView.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 2/26/21.
//

import UIKit

class AddContactView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        addContactBackgroundForEntryFields.roundCorners()
    }
    
    public lazy var addContactBackgroundForEntryFields: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .systemFill
        return uiView
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var poNumberLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    public lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    public lazy var poNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    public lazy var streetTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    public lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    public lazy var stateTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    public lazy var countryTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    public lazy var zipcodeTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private func commonInit()   {
        setupAddContactBackgroundForEntryFieldsConstraints()
        setupFirstNameTextFieldConstraints()
        setupLastNameTextFieldConstraints()
        setupPONumberTextFieldConstraints()
    }
    
    private func setupAddContactBackgroundForEntryFieldsConstraints() {
        addSubview(addContactBackgroundForEntryFields)
        addContactBackgroundForEntryFields.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            addContactBackgroundForEntryFields.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addContactBackgroundForEntryFields.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            addContactBackgroundForEntryFields.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            addContactBackgroundForEntryFields.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
    private func setupFirstNameTextFieldConstraints() {
       addSubview(firstNameTextField)
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func setupLastNameTextFieldConstraints() {
        addSubview(lastNameTextField)
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }
    
    private func setupPONumberTextFieldConstraints() {
        addSubview(poNumberTextField)
        poNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        ])
    }
}
