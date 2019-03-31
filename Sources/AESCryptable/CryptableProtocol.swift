//
//  CryptableProtocol.swift
//  AESCryptable
//
//  Created by Fernando Fernandes on 30.03.19.
//  Copyright © 2019 backslash-f. All rights reserved.
//

import Foundation

/// Conform to this protocol to implement and provide encryption / decryption capabilities.
protocol Cryptable {
    
    /// Encrypts the given `String` and returns it as `Data`.
    ///
    /// - Parameter string: The information to be encrypted.
    /// - Returns: The encrypted information as `Data`.
    /// - Throws: Any `Error` during the encryption operation.
    func encrypt(_ string: String) throws -> Data

    /// Decrypts the given `Data` and returns it as `String`.
    ///
    /// - Parameter data: `Data` object to be decrypted.
    /// - Returns: The decrypted information as `String`.
    /// - Throws: Any `Error` during the decryption operation.
    func decrypt(_ data: Data) throws -> String
}
