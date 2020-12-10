//
//  Bundle+Extension.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 09/12/20.
//

import Foundation

extension Bundle {
    static func plistURLValue(with key: String) -> URL? {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist") else { fatalError("Plist reading error") }
        guard let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] else { fatalError("Plist casting error") }
        guard let value = dict[key] as? String else { fatalError("Plist value String casting error") }
        guard let url = URL(string: value) else { fatalError("Plist value URL casting error") }

        return url
    }
}
