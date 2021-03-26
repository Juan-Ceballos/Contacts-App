//
//  AddContactView.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 2/26/21.
//

import UIKit

class AddContactView: UIView {
    
    override func layoutSubviews() {
        containerView.roundCorners()
    }
    
    public lazy var scrollView: ScrollView = {
        let scrollView = ScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        scrollView.contentOffset = CGPoint(x: 0.0, y: 0.0)
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    public lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        return view
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor(named: "MyTextColor")
        label.font = UIFont(name: "GillSans", size: 22)
        return label
    }()
    
    public lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "First"
        textField.autocorrectionType = .no
        return textField
    }()
    
    public lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Last"
        textField.autocorrectionType = .no
        return textField
    }()
    
    public lazy var poNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.textColor = UIColor(named: "MyTextColor")
        label.font = UIFont(name: "GillSans", size: 22)
        return label
    }()
    
    public lazy var poNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Digits"
        textField.autocorrectionType = .no
        textField.keyboardType = .phonePad
        return textField
    }()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(named: "MyTextColor")
        label.font = UIFont(name: "GillSans", size: 22)
        return label
    }()
    
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Johny@example.com"
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = UIColor(named: "MyTextColor")
        label.font = UIFont(name: "GillSans", size: 22)
        return label
    }()
    
    public lazy var streetTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Street Address"
        textField.autocorrectionType = .no
        return textField
    }()
    
    public lazy var aptTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "apt"
        textField.autocorrectionType = .no
        return textField
    }()
    
    public lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "City"
        textField.autocorrectionType = .no
        return textField
    }()
    
    public lazy var stateTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "State"
        textField.autocorrectionType = .no
        return textField
    }()
    
    public lazy var zipTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Zip Code"
        textField.autocorrectionType = .no
        textField.keyboardType = .numberPad
        return textField
    }()
    
    public lazy var someView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.borderWidth = 10
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupScrollViewConstraints()
        setupContainerViewConstraints()
        setupNameLabelConstraints()
        setupFirstNameTextFieldConstraints()
        setupLastNameTextFieldConstraints()
        setupPoNumberLabelConstraints()
        setupPoNumberTextFieldConstraints()
        setupEmailLabelConstraints()
        setupEmailTextFieldConstraints()
        setupAddressLabelConstraints()
        setupStreetTextFieldConstraints()
        setupAptTextFieldConstraints()
        setupCityTextFieldConstraints()
        setupStateTextFieldConstraints()
        setupZipTextFieldConstraints()
        //setupSomeViewConstraints()
    }
    
    private func setupScrollViewConstraints() {
       addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    private func setupContainerViewConstraints() {
        scrollView.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 11),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -11),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -11),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 11),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func setupNameLabelConstraints() {
        containerView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 11),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
        
        ])
    }
    
    private func setupFirstNameTextFieldConstraints() {
        containerView.addSubview(firstNameTextField)
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            firstNameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 11),
            firstNameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
            firstNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        
        ])
    }
    
    private func setupLastNameTextFieldConstraints() {
        containerView.addSubview(lastNameTextField)
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            lastNameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 11),
            lastNameTextField.leadingAnchor.constraint(equalTo: firstNameTextField.trailingAnchor, constant: 11),
            lastNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
    
        ])
    }
    
    private func setupPoNumberLabelConstraints() {
        containerView.addSubview(poNumberLabel)
        poNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            poNumberLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 22),
            poNumberLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11)
        
        ])
    }
    
    private func setupPoNumberTextFieldConstraints() {
        containerView.addSubview(poNumberTextField)
        poNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            poNumberTextField.topAnchor.constraint(equalTo: poNumberLabel.bottomAnchor, constant: 11),
            poNumberTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
            poNumberTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        
        ])
    }
    
    private func setupEmailLabelConstraints() {
        containerView.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            emailLabel.topAnchor.constraint(equalTo: poNumberTextField.bottomAnchor, constant: 22),
            emailLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11)
        
        ])
    }
    
    private func setupEmailTextFieldConstraints() {
        containerView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 11),
            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
            emailTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        
        ])
    }
    
    private func setupAddressLabelConstraints() {
        containerView.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            addressLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 22),
            addressLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
        
        ])
    }
    
    private func setupStreetTextFieldConstraints() {
        containerView.addSubview(streetTextField)
        streetTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            streetTextField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 11),
            streetTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
            streetTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
        
        ])
    }
    
    private func setupAptTextFieldConstraints() {
        containerView.addSubview(aptTextField)
        aptTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            aptTextField.leadingAnchor.constraint(equalTo: streetTextField.trailingAnchor, constant: 11),
            aptTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            aptTextField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 11)
        
        ])
    }
    
    private func setupCityTextFieldConstraints() {
        containerView.addSubview(cityTextField)
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            cityTextField.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 11),
            cityTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
            cityTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4)
        
        ])
    }
    
    private func setupStateTextFieldConstraints() {
        containerView.addSubview(stateTextField)
        stateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            stateTextField.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 11),
            stateTextField.leadingAnchor.constraint(equalTo: cityTextField.trailingAnchor, constant: 11),
            stateTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        
        ])
    }
    
    private func setupZipTextFieldConstraints() {
        containerView.addSubview(zipTextField)
        zipTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            zipTextField.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 11),
            zipTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
            zipTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            zipTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -11)
        ])
    }
    
    private func setupSomeViewConstraints() {
        containerView.addSubview(someView)
        someView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            someView.topAnchor.constraint(equalTo: zipTextField.bottomAnchor, constant: 11),
            someView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11),
            someView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            someView.heightAnchor.constraint(equalToConstant: 200),
            someView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -11)
            
        ])
    }
    
}
