//
//  UIImageView+Extensions.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 3/19/21.
//

import UIKit

extension UIImageView {

    func makeRoundedIV() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}
