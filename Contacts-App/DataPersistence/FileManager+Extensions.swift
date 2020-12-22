//
//  FileManager+Extensions.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 12/22/20.
//

import Foundation

extension FileManager {
    static func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
