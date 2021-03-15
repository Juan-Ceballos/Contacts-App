//
//  ContactsView.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 11/19/20.
//

import UIKit

public enum SectionKind: Int, CaseIterable {    
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case i
    case j
    case k
    case l
    case m
    case n
    case o
    case p
    case q
    case r
    case s
    case t
    case u
    case v
    case w
    case x
    case y
    case z
    
    var sectionTitle: String {
        switch self {
        case .a:
            return "A"
        case .b:
            return "B"
        case .c:
            return "C"
        case .d:
            return "D"
        case .e:
            return "E"
        case .f:
            return "F"
        case .g:
            return "G"
        case .h:
            return "H"
        case .i:
            return "I"
        case .j:
            return "J"
        case .k:
            return "K"
        case .l:
            return "L"
        case .m:
            return "M"
        case .n:
            return "N"
        case .o:
            return "O"
        case .p:
            return "P"
        case .q:
            return "Q"
        case .r:
            return "R"
        case .s:
            return "S"
        case .t:
            return "T"
        case .u:
            return "U"
        case .v:
            return "V"
        case .w:
            return "W"
        case .x:
            return "X"
        case .y:
            return "Y"
        case .z:
            return "Z"
            
        }
    }
}

final class BackgroundSupplementaryView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 8
        backgroundColor = .systemFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ContactsView: UIView {
    
    public lazy var contactsCollectionView: UICollectionView = {
        let layout = createLayout()
        layout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: "background")
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let sectionInset: CGFloat = 32
            let backgroundInset: CGFloat = 22
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.07))
            
            let groupA = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: groupA)
            
            
            section.contentInsets = NSDirectionalEdgeInsets(top: sectionInset, leading: sectionInset, bottom: sectionInset, trailing: sectionInset)
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
            
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            header.extendsBoundary = false
            
            let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
            guard SectionKind(rawValue: sectionIndex) != nil else {
                fatalError()
            }
                        
            section.boundarySupplementaryItems = [header]
            backgroundItem.contentInsets = NSDirectionalEdgeInsets(top: backgroundInset, leading: backgroundInset, bottom: backgroundInset, trailing: backgroundInset)
            section.decorationItems = [backgroundItem]
            
            return section
        }
        
        return layout
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupContactsCollectionViewConstraints()
    }
    
    private func setupContactsCollectionViewConstraints() {
        addSubview(contactsCollectionView)
        contactsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactsCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contactsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contactsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contactsCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
