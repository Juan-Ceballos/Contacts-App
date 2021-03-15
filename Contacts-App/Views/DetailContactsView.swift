//
//  DetailContactsView.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/15/21.
//

import UIKit

class DetailContactsView: UIView {
    
    public lazy var detailContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemFill
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
        
    }
    
}

