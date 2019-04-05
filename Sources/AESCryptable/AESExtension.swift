//
//  AESExtension.swift
//  AESCryptable
//
//  Created by Fernando Fernandes on 30.03.19.
//  Copyright © 2019 backslash-f. All rights reserved.
//

import Foundation
import CommonCrypto

// MARK: - Public Extension

public extension AES {

    /// Encapsulates errors that may occur during AES encrypt / decrypt operations.
    ///
    /// - invalidKeySize: The given key `String` count isn't equal to `kCCKeySizeAES256`.
    /// - emptyStringToEncrypt: The given `String` to encrypt is empty.
    /// - generateRandomIVFailed: Could not generate a random `iv` via `SecRandomCopyBytes(_:_:_:)`.
    /// - encryptDataFailed: `CCCryptorStatus` was different than `kCCSuccess` during an encryption operation.
    /// - stringToDataFailed: Failed to convert `String` into `Data` via `data(using:allowLossyConversion:)`.
    /// - decryptDataFailed: `CCCryptorStatus` was different than `kCCSuccess` during a decryption operation.
    /// - dataToStringFailed: Failed to convert `Data` into `String`. E.g.: via `String.init(bytes:encoding:)`.
    enum Error: Swift.Error {
        case invalidKeySize
        case emptyStringToEncrypt
        case generateRandomIVFailed
        case encryptionFailed
        case decryptionFailed
        case dataToStringFailed
    }
}

// MARK: - Internal Extension

internal extension AES {
    
    /// Generates an `Initialization Vector` with random data for the `Cipher Block Chaining (CBC)` mode with
    /// block size `kCCBlockSizeAES128` and append it to the give `Data`.
    ///
    /// - Parameter data: The `Data` in which the generated `iv` will be attached into.
    /// - Throws: `AESError`
    func generateRandomIV(for data: inout Data) throws {
        
        try data.withUnsafeMutableBytes { dataBytes in
            
            guard let dataBytesBaseAddress = dataBytes.baseAddress else {
                throw Error.generateRandomIVFailed
            }
            
            let status: Int32 = SecRandomCopyBytes(
                kSecRandomDefault,
                kCCBlockSizeAES128,
                dataBytesBaseAddress
            )
            
            guard status == 0 else {
                throw Error.generateRandomIVFailed
            }
        }
    }
}
