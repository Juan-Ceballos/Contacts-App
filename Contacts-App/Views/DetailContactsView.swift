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
        detailSettingsView.roundCorners()
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
        return button
    }()
    
    public lazy var phoneImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        button.tintColor = .systemGreen
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    public lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.tintColor = .systemPurple
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    public lazy var mapButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "map.fill"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .systemBackground
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    public lazy var streetAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    public lazy var aptLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    public lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    public lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    public lazy var zipCodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    public lazy var detailSettingsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        return view
    }()
    
    public lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    public lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
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
        setupDetailSettingsViewConstraints()
        setupFavoriteButtonConstraints()
        setupEditButtonConstraints()
        setupAddressLabelConstraints()
        setupStreetAddressLabelConstraints()
        setupAptLabelConstraints()
        setupCityLabelConstraints()
        setupStateLabelConstraints()
        setupZipcodeConstraints()
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
            emailButton.topAnchor.constraint(equalTo: phoneNumberTextLabel.bottomAnchor, constant: 11),
            emailButton.heightAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.13),
            emailButton.widthAnchor.constraint(equalTo: detailContainerViewContact.widthAnchor, multiplier: 0.5),
            emailButton.centerXAnchor.constraint(equalTo: detailContainerViewContact.centerXAnchor)
        ])
    }
    
    private func setupPhoneImageViewConstraints() {
        addSubview(phoneImageButton)
        phoneImageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneImageButton.leadingAnchor.constraint(equalTo: detailContainerViewContact.leadingAnchor, constant: 22),
            phoneImageButton.bottomAnchor.constraint(equalTo: detailContainerViewContact.bottomAnchor, constant: -33),
            phoneImageButton.heightAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.12),
            phoneImageButton.widthAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.12)
        
        ])
    }
    
    private func setupMessageButtonConstraints() {
        addSubview(messageButton)
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageButton.centerXAnchor.constraint(equalTo: detailContainerViewContact.centerXAnchor),
            messageButton.bottomAnchor.constraint(equalTo: detailContainerViewContact.bottomAnchor, constant: -33),
            messageButton.heightAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.12),
            messageButton.widthAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.12)
        ])
    }
    
    private func setupMapButtonConstraints() {
        addSubview(mapButton)
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapButton.trailingAnchor.constraint(equalTo: detailContainerViewContact.trailingAnchor, constant: -22),
            mapButton.bottomAnchor.constraint(equalTo: detailContainerViewContact.bottomAnchor, constant: -33),
            mapButton.heightAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.12),
            mapButton.widthAnchor.constraint(equalTo: detailContainerViewContact.heightAnchor, multiplier: 0.12)
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
    
    private func setupDetailSettingsViewConstraints() {
        addSubview(detailSettingsView)
        detailSettingsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailSettingsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            detailSettingsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            detailSettingsView.topAnchor.constraint(equalTo: detailContainerViewAddress.bottomAnchor, constant: 11),
            detailSettingsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11)
        
        ])
    }
    
    private func setupFavoriteButtonConstraints() {
        addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteButton.centerXAnchor.constraint(equalTo: detailSettingsView.centerXAnchor),
            favoriteButton.centerYAnchor.constraint(equalTo: detailSettingsView.centerYAnchor),
            favoriteButton.widthAnchor.constraint(equalTo: mapButton.heightAnchor),
            favoriteButton.heightAnchor.constraint(equalTo: mapButton.heightAnchor)
        
        ])
    }
    
    private func setupEditButtonConstraints() {
        addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.centerYAnchor.constraint(equalTo: favoriteButton.centerYAnchor),
            editButton.trailingAnchor.constraint(equalTo: detailSettingsView.trailingAnchor, constant: -self.frame.size.width * 0.25),
            editButton.widthAnchor.constraint(equalTo: mapButton.heightAnchor),
            editButton.heightAnchor.constraint(equalTo: mapButton.heightAnchor)
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
    
    private func setupStreetAddressLabelConstraints() {
        addSubview(streetAddressLabel)
        streetAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            streetAddressLabel.bottomAnchor.constraint(equalTo: detailContainerViewAddress.centerYAnchor),
            streetAddressLabel.trailingAnchor.constraint(equalTo: detailContainerViewAddress.centerXAnchor)
        
        ])
    }
    
    private func setupAptLabelConstraints() {
        addSubview(aptLabel)
        aptLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aptLabel.bottomAnchor.constraint(equalTo: detailContainerViewAddress.centerYAnchor),
            aptLabel.leadingAnchor.constraint(equalTo: streetAddressLabel.trailingAnchor, constant: 11)
            
        ])
    }
    
    private func setupCityLabelConstraints() {
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: streetAddressLabel.bottomAnchor, constant: 11),
            cityLabel.leadingAnchor.constraint(equalTo: streetAddressLabel.leadingAnchor)
        
        ])
    }
    
    private func setupStateLabelConstraints() {
        addSubview(stateLabel)
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateLabel.topAnchor.constraint(equalTo: streetAddressLabel.bottomAnchor, constant: 11),
            stateLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 11)
        
        ])
    }
    
    private func setupZipcodeConstraints() {
        addSubview(zipCodeLabel)
        zipCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            zipCodeLabel.topAnchor.constraint(equalTo: streetAddressLabel.bottomAnchor, constant: 11),
            zipCodeLabel.leadingAnchor.constraint(equalTo: stateLabel.trailingAnchor, constant: 11)
            
        ])
    }
    
}

