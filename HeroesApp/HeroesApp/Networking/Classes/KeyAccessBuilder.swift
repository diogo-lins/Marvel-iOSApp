//
//  KeyAccessBuilder.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 09/12/20.
//

import Foundation
import CryptoSwift

struct KeyAccessBuilder {

    static private var timestamp: String = ""
    static private let publicKey: String = "9ac938891e63bf8f38ff77e4a2ed808e"
    static private let privateKey: String = "4f5d69fec41e08fda9747228b5a9e14605cc84a6"

    static func getTimeStamp() -> String {
        KeyAccessBuilder.timestamp = Date().timeIntervalSince1970.description
        return KeyAccessBuilder.timestamp
    }

    static func getPublicKey() -> String {
        return KeyAccessBuilder.publicKey
    }

    static func getPrivateKey() -> String {
        return KeyAccessBuilder.privateKey
    }

    static func getHash() -> String {
        return "\(KeyAccessBuilder.timestamp)\(KeyAccessBuilder.privateKey)\(KeyAccessBuilder.publicKey)".md5()
    }
}
