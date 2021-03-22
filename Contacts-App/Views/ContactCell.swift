//
//  ContactCell.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 11/19/20.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    static let reuseIdentifier = "contactCell"
    
    override func layoutSubviews() {

        contactPhotoView.makeRounded()
        
    }
    
    public lazy var contactPhotoView: UIView = {
        let uiView = UIView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.height * 0.8, height: contentView.frame.size.height * 0.8))
        uiView.backgroundColor = UIColor(named: "MyBubbleColor")
        return uiView
    }()
    
    public lazy var initialsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 22)
        label.textColor = UIColor(named: "MyTextColor")
        return label
    }()
    
    public lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 20)
        label.textColor = UIColor(named: "MyTextColor")
        return label
    }()
    
    public lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 24)
        return label
    }()
    
    public lazy var cellDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
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
        setupContactPhotoImageViewConstraints()
        setupInitialsLabelConstraints()
        setupFullNameLabelConstraints()
        //setupNumberLabelConstraints()
        setupCellDividerViewConstraints()
    }
    
    private func setupContactPhotoImageViewConstraints() {
        addSubview(contactPhotoView)
        contactPhotoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            contactPhotoView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactPhotoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            contactPhotoView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            contactPhotoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            contactPhotoView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            contactPhotoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
            
        ])
    }
    
    private func setupInitialsLabelConstraints() {
        addSubview(initialsLabel)
        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            initialsLabel.centerYAnchor.constraint(equalTo: contactPhotoView.centerYAnchor),
            initialsLabel.centerXAnchor.constraint(equalTo: contactPhotoView.centerXAnchor)
        
        ])
    }
    
    private func setupFullNameLabelConstraints() {
        addSubview(fullNameLabel)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: contactPhotoView.trailingAnchor, constant: 8),
            fullNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupNumberLabelConstraints() {
        addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor, constant: 8),
            numberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }
    
    private func setupCellDividerViewConstraints() {
        addSubview(cellDividerView)
        cellDividerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellDividerView.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 11),
            cellDividerView.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            cellDividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellDividerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.025)
        
        ])
    }
    
}
