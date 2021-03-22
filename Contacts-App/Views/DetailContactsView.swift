//
//  DetailContactsView.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/15/21.
//

import UIKit

class DetailContactsView: UIView {
    
    override func layoutSubviews() {
        // rounded corner for container detailview
        detailContainerView.roundCorners()
    }
    
    public lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    public lazy var detailContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
        return view
    }()
    
    public lazy var fullNameTextLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var phoneNumberTextLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var phoneImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        button.tintColor = .systemGreen
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
        setupPhoneImageViewConstraints()
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
        addSubview(detailContainerView)
        detailContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            detailContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            detailContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            detailContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.33)
        ])
    }
    
    private func setupFullNameTextLabelConstraints() {
        addSubview(fullNameTextLabel)
        fullNameTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullNameTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            fullNameTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            fullNameTextLabel.centerYAnchor.constraint(equalTo: detailContainerView.centerYAnchor)
        
        ])
    }
    
    private func setupPhoneNumberTextLabelConstraints() {
        addSubview(phoneNumberTextLabel)
        phoneNumberTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumberTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            phoneNumberTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            phoneNumberTextLabel.topAnchor.constraint(equalTo: fullNameTextLabel.bottomAnchor, constant: 8)
        
        ])
    }
    
    private func setupPhoneImageViewConstraints() {
        addSubview(phoneImageButton)
        phoneImageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneImageButton.centerXAnchor.constraint(equalTo: detailContainerView.centerXAnchor),
            phoneImageButton.topAnchor.constraint(equalTo: phoneNumberTextLabel.bottomAnchor, constant: 8),
            phoneImageButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            phoneImageButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        
        ])
    }
    
}

