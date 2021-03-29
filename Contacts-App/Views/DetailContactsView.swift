//
//  DetailContactsView.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/15/21.
//

import UIKit

class DetailContactsView: UIView {
    
    override func layoutSubviews() {
        detailContainerViewContact.roundCorners()
        detailContainerViewAddress.roundCorners()
        editButton.makeRounded()
    }
    
    public lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    public lazy var detailContainerViewContact: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        return view
    }()
    
    public lazy var detailContainerViewAddress: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        return view
    }()
    
    public lazy var fullNameTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28)
        label.textColor = .systemBackground
        return label
    }()
    
    public lazy var phoneNumberTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 19)
        label.textAlignment = .center
        return label
    }()
    
    public lazy var emailButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    public lazy var phoneImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        button.tintColor = .systemGreen
        return button
    }()
    
    public lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.tintColor = .systemPurple
        return button
    }()
    
    public lazy var mapButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "map.fill"), for: .normal)
        return button
    }()
    
    public lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemFill
        button.setTitle("Edit", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 44)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .systemBackground
        label.font = .boldSystemFont(ofSize: 22)
        return label
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
        setupBackgroundViewConstraints()
        setupDetailCointainerViewConstraints()
        setupFullNameTextLabelConstraints()
        setupPhoneNumberTextLabelConstraints()
        setupemailButtonConstraints()
        setupPhoneImageViewConstraints()
        setupMessageButtonConstraints()
        setupMapButtonConstraints()
        setupDetailContainerViewAddress()
        setupEditButtonConstraints()
        setupAddressLabelConstraints()
    }
    
    private func setupBackgroundViewConstraints() {
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        ])
    }
    
    private func setupDetailCointainerViewConstraints() {
        addSubview(detailContainerViewContact)
        detailContainerViewContact.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailContainerViewContact.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            detailContainerViewContact.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            detailContainerViewContact.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22),
            detailContainerViewContact.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25)
        ])
    }
    
    private func setupFullNameTextLabelConstraints() {
        addSubview(fullNameTextLabel)
        fullNameTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullNameTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            fullNameTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            fullNameTextLabel.topAnchor.constraint(equalTo: detailContainerViewContact.topAnchor, constant: 11)
        ])
    }
    
    private func setupPhoneNumberTextLabelConstraints() {
        addSubview(phoneNumberTextLabel)
        phoneNumberTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumberTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            phoneNumberTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            phoneNumberTextLabel.topAnchor.constraint(equalTo: fullNameTextLabel.bottomAnchor, constant: 13)
        
        ])
    }
    
    private func setupemailButtonConstraints() {
        addSubview(emailButton)
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            emailButton.leadingAnchor.constraint(equalTo: detailContainerViewContact.leadingAnchor, constant: 22),
            emailButton.topAnchor.constraint(equalTo: phoneNumberTextLabel.bottomAnchor, constant: 22),
            emailButton.heightAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.13),
            emailButton.widthAnchor.constraint(equalTo: detailContainerViewContact.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupPhoneImageViewConstraints() {
        addSubview(phoneImageButton)
        phoneImageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneImageButton.leadingAnchor.constraint(equalTo: detailContainerViewContact.leadingAnchor, constant: 22),
            phoneImageButton.bottomAnchor.constraint(equalTo: detailContainerViewContact.bottomAnchor, constant: -33),
            phoneImageButton.heightAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.13),
            phoneImageButton.widthAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.13)
        
        ])
    }
    
    private func setupMessageButtonConstraints() {
        addSubview(messageButton)
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            messageButton.centerXAnchor.constraint(equalTo: detailContainerViewContact.centerXAnchor),
            messageButton.bottomAnchor.constraint(equalTo: detailContainerViewContact.bottomAnchor, constant: -33),
            messageButton.heightAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.13),
            messageButton.widthAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.13)
        ])
    }
    
    private func setupMapButtonConstraints() {
        addSubview(mapButton)
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            mapButton.trailingAnchor.constraint(equalTo: detailContainerViewContact.trailingAnchor, constant: -22),
            mapButton.bottomAnchor.constraint(equalTo: detailContainerViewContact.bottomAnchor, constant: -33),
            mapButton.heightAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.13),
            mapButton.widthAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.13)
        ])
    }
    
    private func setupDetailContainerViewAddress() {
        addSubview(detailContainerViewAddress)
        detailContainerViewAddress.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailContainerViewAddress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            detailContainerViewAddress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            detailContainerViewAddress.topAnchor.constraint(equalTo: detailContainerViewContact.bottomAnchor, constant: 11),
            detailContainerViewAddress.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.44)
        ])
    }
    
    private func setupEditButtonConstraints() {
        addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            editButton.topAnchor.constraint(equalTo: detailContainerViewAddress.bottomAnchor, constant: 11),
            editButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            editButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            editButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.11)
        ])
    }
    
    private func setupAddressLabelConstraints() {
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            addressLabel.topAnchor.constraint(equalTo: detailContainerViewAddress.topAnchor, constant: 11),
            addressLabel.leadingAnchor.constraint(equalTo: detailContainerViewAddress.leadingAnchor, constant: 11)
        
        ])
    }
    
}

