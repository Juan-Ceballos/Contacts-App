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
        detailContainerView.layer.cornerRadius = 8
    }
    
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
    
    public lazy var phoneImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
        setupDetailCointainerViewConstraints()
        setupFullNameTextLabelConstraints()
        setupPhoneNumberTextLabelConstraints()
        setupPhoneImageViewConstraints()
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
        addSubview(phoneImageView)
        phoneImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneImageView.centerXAnchor.constraint(equalTo: detailContainerView.centerXAnchor),
            phoneImageView.topAnchor.constraint(equalTo: phoneNumberTextLabel.bottomAnchor, constant: 8)
        
        ])
    }
    
}

